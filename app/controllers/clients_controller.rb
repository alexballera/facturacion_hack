class ClientsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_asistente!, only: [:edit, :update, :new]
  before_action :authenticate_admin!, only: [:destroy]

  def index
		@clients = Client.paginate(page: params[:page],per_page:5).ultimos 
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
    @clients = Client.paginate(page: params[:page],per_page:5).clientes
    render :index
  end

  def clientes_recurrentes
    @clients = Client.paginate(page: params[:page],per_page:5).clientes.recurrentes
    render :index
  end

  def clientes_puntuales
    @clients = Client.paginate(page: params[:page],per_page:5).clientes.puntuales
    render :index
  end

  def sponsors 
    @clients = Client.paginate(page: params[:page],per_page:5).sponsor
    render :index
  end

  def sponsors_recurrentes
    @clients = Client.paginate(page: params[:page],per_page:5).sponsor.recurrentes
    render :index
  end

  def sponsors_puntuales
    @clients = Client.paginate(page: params[:page],per_page:5).sponsor.puntuales
    render :index
  end

  def proveedores 
    @clients = Client.paginate(page: params[:page],per_page:5).proveedores
    render :index
  end

  def proveedores_recurrentes
    @clients = Client.paginate(page: params[:page],per_page:5).proveedores.recurrentes
    render :index
  end

  def proveedores_puntuales
    @clients = Client.paginate(page: params[:page],per_page:5).proveedores.puntuales
    render :index
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
