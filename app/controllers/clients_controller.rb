class ClientsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy, :print]
  before_action :authenticate_asistente!, only: [:edit, :update, :new]
  before_action :authenticate_admin!, only: [:destroy, :print]

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

  def clientes 
    @clientes = Client.clientes
  end

  def clientes_recurrentes
    @clientes = Client.clientes.recurrentes
  end

  def clientes_puntuales
    @clientes = Client.clientes.puntuales
  end

  def sponsor 
    @sponsor = Client.sponsor
  end

  def sponsor_recurrentes
    @sponsor = Client.sponsor.recurrentes
  end

  def sponsor_puntuales
    @sponsor = Client.sponsor.puntuales
  end

  def proveedores 
    @proveedores = Client.proveedores
  end

  def proveedores_recurrentes
    @proveedores = Client.proveedores.recurrentes
  end

  def proveedores_puntuales
    @proveedores = Client.proveedores.puntuales
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
