class OrderedProductsController < ApplicationController
	def index
	end

	def new
		# if (@current_order.orderedProduct.ids.includes(params[:product_id]))
			@orderedProduct = OrderedProduct.create(product_id: params[:product_id], order_id: @current_order.id)
			@orderedProduct.save
			render :index
	end

	def destroy
		
	end

end
