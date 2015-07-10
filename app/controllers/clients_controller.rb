class ClientsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
		@clients = Client.all
	end

	def show		
	end

	def new
		@client = Client.new
	end

	def edit
	end
  
  def create
    @client = current_user.clients.new(client_params)
    respond_to do |format|
      if @client.save
          format.html { redirect_to @client, :notice => 'El cliente fue creado exitosamente' }
          format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end   
    end
  end


	def update
		respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, :notice => 'El cliente fue editado exitosamente' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, :notice => 'El cliente fue borrado exitosamente' }
      format.json { head :no_content }
    end
	end

	private

	def set_client
		@client = Client.find(params[:id])
	end

	def client_params
		params.require(:client).permit(:nombre, :apellido, 
			:identificacion, :email, :telefono, :direccion, 
			:descripcion, :tipo, :frecuencia, :user_id)
	end
end
