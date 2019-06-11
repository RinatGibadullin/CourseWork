class OrdersController < ApplicationController

	def show
	end
	def update
		@current_order.update_attribute(:status, params[:order][:status])
		redirect_to :controller => 'ordered_products', :action => 'index'
	end

	private 
	def post_params
		params.require(:current_order).permit(:status)
	end
end
