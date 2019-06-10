class CartProductController < ApplicationController
	def create
		session[:cart] = []
		session[:cart] <= {:product_id, 1}

	end

	def destroy
		
	end
end
