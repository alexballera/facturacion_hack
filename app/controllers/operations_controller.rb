class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_operation, only: [:show, :edit, :update, :destroy, :print, :cancel, :pay]
  before_action :authenticate_asistente!, only: [:edit, :update, :new, :pay, :print]
  before_action :authenticate_admin!, only: [:destroy, :cancel]

  # GET /operations
  # GET /operations.json
  def index
    @operations = Operation.paginate(page: params[:page],per_page:5).ultimos    
  end

  # GET /operations/1
  # GET /operations/1.json
  def show
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
  end

  # POST /operations
  # POST /operations.json
  def create
    @operation = current_user.operations.new(operation_params)
    respond_to do |format|
      if @operation.save
        format.html { redirect_to @operation, :notice => 'La operación fue creada exitosamente y se envió el email al interesado' }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1
  # PATCH/PUT /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to @operation, :notice => 'La operación fue editada exitosamente' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    @operation.destroy
    respond_to do |format|
      format.html { redirect_to operations_url, 
        :alert => 'La factura fue borrada exitosamente' }
      format.json { head :no_content }
    end
  end

  #PUT /operations/:id/print
  def print 
    respond_to do |format|
      if @operation.print!
        format.html { redirect_to @operation, :notice => 'La factura fue emitida exitosamente' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  def pay  
    respond_to do |format|
      if @operation.pay!
        format.html { redirect_to @operation, :notice => 'La factura fue pagada exitosamente' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel 
    respond_to do |format|
      if @operation.cancel!
        format.html { redirect_to @operation, :notice => 'La factura fue anulada exitosamente' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  #FACTURAS:
  def borradores 
    @operations = Operation.paginate(page: params[:page],per_page:5).borradores
    render :index
  end 

  def impresas 
    @operations = Operation.paginate(page: params[:page],per_page:5).impresas
    render :index
  end

  def pagadas 
    @operations = Operation.paginate(page: params[:page],per_page:5).pagadas
    render :index
  end 

  def canceladas 
    @operations = Operation.paginate(page: params[:page],per_page:5).canceladas
    render :index
  end


  #VENTAS
  def ventas 
    @operations = Operation.paginate(page: params[:page],per_page:5).ventas
    render :index
  end  

  def ventas_borrador
    @operations = Operation.paginate(page: params[:page],per_page:5).ventas.borradores
    render :index
  end  

  def ventas_impresas
    @operations = Operation.paginate(page: params[:page],per_page:5).ventas.impresas
    render :index
  end

  def ventas_contado 
    @operations = Operation.paginate(page: params[:page],per_page:5).ventas.contado
    render :index
  end

  def ventas_credito 
    @operations = Operation.paginate(page: params[:page],per_page:5).ventas.credito
    render :index
  end

  #COMPRAS
  def compras 
    @operations = Operation.paginate(page: params[:page],per_page:5).compras
    render :index
  end  

  def compras_borrador
    @operations = Operation.paginate(page: params[:page],per_page:5).compras.borradores
    render :index
  end  

  def compras_impresas
    @operations = Operation.paginate(page: params[:page],per_page:5).compras.impresas
    render :index
  end

  def compras_contado 
    @operations = Operation.paginate(page: params[:page],per_page:5).compras.contado
    render :index
  end

  def compras_credito 
    @operations = Operation.paginate(page: params[:page],per_page:5).compras.credito
    render :index
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_operation
    @operation = Operation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def operation_params
    params.require(:operation).permit(:operacion, :pago, 
      :cantidad, :subtotal, :impuestos, :total, 
      :tasa, :balance, :fecha, :comprobante, :user_id, :client_id, 
      :product_id, :cover, :state)
  end
end
