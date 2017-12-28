module ClientContacts
  class SendEmail
    def initialize(client_contact, message, email, from)
      @client_contact = client_contact
      @message = message
      @email = email
      @from = from
      @action_view = ActionView::Base.new
      @tempfile = Tempfile.new(%w(client_contact .pdf))
    end

    def call
      generate_pdf
      ClientContactMailer.client_contact(
        email: email, file: tempfile, message: message, from: from
        ).deliver
    end

    private
    attr_reader :email, :client_contact, :message, :from
    attr_accessor :tempfile, :action_view

    def view
      # create an instance of ActionView, so we can use the render method outside of a controller
      action_view.view_paths = ActionController::Base.view_paths
      action_view
    end

    def pdf
      WickedPdf.new.pdf_from_string(
        view.render(
          template: 'client_contacts/show.html.erb',
          locals: { client_contact: client_contact },
          layout: nil,
        ),
        margin: { top: 15, bottom: 25, right: 15, left: 15 }
      )
    end

    def generate_pdf
      tempfile.binmode
      tempfile.write pdf
      tempfile.close
    end
  end
end
