class ProductsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_product, except: [:index,:new, :create]

	def index
		@products = Product.all
	end

	def show		
	end

	def new
		@product = Product.new
	end

	def create
		@product = current_user.products.new(product_params)
		if @product.save
			redirect_to @product, :notice => 'El producto fue creado exitosamente'
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to @product, :notice => 'El producto fue editado exitosamente'
		else
			render :edit
		end
	end

	def destroy
		@product.destroy
		redirect_to products_path, :notice => 'El producto fue borrado exitosamente'
	end

	private

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:nombre, :descripcion, :precio)
	end
end