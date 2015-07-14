class ProductsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_asistente!, only: [:edit, :update, :new]
  before_action :authenticate_admin!, only: [:destroy]

	def index
		@products = Product.paginate(page: params[:page],per_page:5).ultimos
	end

	def show		
	end

	def new
		@product = Product.new
	end

	def edit
	end
  
  def create
    @product = current_user.products.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, :notice => 'El producto fue creado exitosamente' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


	def update
		respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, :notice => 'El producto fue editado exitosamente' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end		
	end

	def destroy
		@product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, :notice => 'El producto fue borrado exitosamente' }
      format.json { head :no_content }
    end
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:producto, :descripcion, :precio, :user_id)
	end
end