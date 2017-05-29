class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.all.map do |client|
      client.as_json.merge(show_path: client_path(client).as_json,
        edit_path: edit_client_path(client).as_json)
    end
  end

  def index_search
    clients = Client.where('first_name LIKE ? OR last_name LIKE ?',
                           "%#{params[:search]}%", "%#{params[:search]}%")
    clients_json = clients.map do |client|
                     client.as_json.merge(show_path: client_path(client).as_json,
                     edit_path: edit_client_path(client).as_json)
                   end
    render json: clients_json
  end

  # GET /clients/1
  def show
    @address = @client.client_detail
  end

  # GET /clients/new
  def new
    @client = Client.new
    @client.build_client_detail
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def client_params
    params.require(:client).permit(
      :first_name,
      :last_name,
      :date_of_birth,
      :medical_condition,
      client_detail_attributes: [
        :housename,
        :street_name,
        :street_name_2,
        :parish,
        :island,
        :email,
        :landline,
        :mobile
      ]
    )
  end
end
