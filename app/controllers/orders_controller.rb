class OrdersController < ApplicationController

	def show
	end
	def update
		@current_order.update_attributes(:status)
		redirect_to @current_order
	end
end
