class ClientContactMailer < ActionMailer::Base
  def client_contact(email:, file:, message:, from:)
    @message = message
    attachments['client_contact.pdf'] = open(file).read
    mail(
      subject: 'Client Contact',
      to: email,
      from: from,
    )
  end
end
