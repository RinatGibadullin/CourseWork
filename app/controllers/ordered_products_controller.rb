class OrderedProductsController < ApplicationController
	def index
	end

	def new
		@productsIdArray ||= []

		@current_order.ordered_products.each do |ordered_product|
			@productsIdArray.push(ordered_product.product.id.to_s)
		end



		if @productsIdArray.include?(params[:product_id])
			@orderedProduct = OrderedProduct.where("product_id = ? and order_id = ?", 
				params[:product_id], @current_order.id)
			@orderedProduct.update_attributes(
				:amount => (@orderedProduct.amount + params[:amount].to_int), 
				:price => @orderedProduct.product.price * (@orderedProduct.amount + params[:amount].to_int))

			@orderedProduct.save
			redirect_to products_path
		else
			@orderedProduct = OrderedProduct.create(product_id: params[:product_id], 
				order_id: @current_order.id, 
				amount: params[:amount])
			@orderedProduct.update_attributes(
				:price => @orderedProduct.product.price * @orderedProduct.amount)
			@orderedProduct.save
			redirect_to products_path
		end
	end

	def destroy
		
	end

end
