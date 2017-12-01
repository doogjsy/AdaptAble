class ClientContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:create]
  before_action :set_client_contact, only: [:send_email]

  def create
    contact = @client.client_contacts.create(
      date: params[:client_contact][:date],
      contact_type: params[:client_contact][:contact_type],
      notes: params[:client_contact][:notes]
    )
    if contact.errors.any?
      contact = contact.as_json.merge(errors: contact.errors.full_messages.as_json)
    end

    render json: contact
  end

  def send_email
    ::ClientContacts::SendEmail.new(@client_contact, params[:message], params[:email]).call
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_client_contact
    @client_contact = ClientContact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_contact_params
    params.require(:client_contact).permit(
      :date,
      :contact_type,
      :notes
    )
  end
end
