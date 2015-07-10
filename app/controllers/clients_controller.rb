class ClientsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	before_action :set_client, except: [:index,:new,:create]

  def index
		@clients = Client.all
	end

	def show		
	end

	def new
		@client = Client.new
	end

	def create
		@client = current_user.clients.new(client_params)
		if @client.save
			redirect_to @client, :notice => 'El cliente fue creado exitosamente'
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @client.update(client_params)
			redirect_to @client, :notice => 'El cliente fue editado exitosamente'
		else
			render :edit
		end
	end

	def destroy
		@client.destroy
		redirect_to clients_path, :notice => 'El cliente fue borrado exitosamente'
	end

	private

	def set_client
		@client = Client.find(params[:id])
	end

	def client_params
		params.require(:client).permit(:nombre, :apellido, 
			:identificacion, :email, :telefono, :direccion, 
			:descripcion, :tipo, :frecuencia)
	end
end
