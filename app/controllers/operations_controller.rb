class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_operation, only: [:show, :edit, :update, :destroy, :print, :cancel, :pay]
  before_action :authenticate_asistente!, only: [:edit, :update, :new, :pay, :print]
  before_action :authenticate_admin!, only: [:destroy, :cancel]

  # GET /operations
  # GET /operations.json
  def index
    @operations = Operation.all
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
        format.html { redirect_to @operation, :notice => 'La operación fue creada exitosamente' }
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
        :alert => 'La operación fue borrada exitosamente' }
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
        format.html { redirect_to @operation, :notice => 'La factura fue cancelada exitosamente' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  #FACTURAS:
  def borrador 
    @borrador = Operation.borrador
  end 

  def impresas 
    @impresas = Operation.impresas
  end

  def canceladas 
    @impresas = Operation.canceladas
  end

  def pagadas 
    @impresas = Operation.pagadas
  end 

  #VENTAS
  def ventas 
    @ventas = Operation.ventas
  end  

  def ventas_borrador
    @ventas = Operation.ventas.borrador
  end  

  def ventas_impresas
    @ventas = Operation.ventas.impresas
  end

  def ventas_contado 
    @ventas = Operation.ventas.contado
  end

  def ventas_credito 
    @compras = Operation.compras.credito
  end

  #COMPRAS
  def compras 
    @compras = Operation.compras
  end  

  def compras_borrador
    @compras = Operation.compras.borrador
  end  

  def compras_impresas
    @compras = Operation.compras.impresas
  end

  def compras_contado 
    @compras = Operation.compras.contado
  end

  def compras_credito 
    @compras = Operation.compras.credito
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
