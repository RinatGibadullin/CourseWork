class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_user!, except: [:index, :show]
	def index
		@product = Product.all
	end

	def show
		@product = Product.find(params[:id])
		
	end

	def new
		@product = Product.new
	end

	def create
		# @post = Post.new(post_params)
		# @post.user_id = current_user.id

		@user = current_user
		@product = Product.new(post_params)
		@product.picture = params[:file]

		if @product.save
			redirect_to @product
		else
			render :new
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update_attributes(post_params)
			redirect_to @product
		else
			render :edit
		end
	end


	private 

	def set_product
      @product = Product.find(params[:id])
    end

	def post_params
		params.require(:product).permit(:category,:title,:description,:price)
	end
end
