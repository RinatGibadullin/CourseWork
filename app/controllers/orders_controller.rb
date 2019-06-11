class OrdersController < ApplicationController

	def show
	end
	def update
		current_user_id = nil
		if !current_user.nil?
			current_user_id = current_user.id
		end
		@current_order.update_attributes(:status => params[:order][:status], :user_id => current_user_id)
		redirect_to :controller => 'ordered_products', :action => 'index'
	end

	private 
	def post_params
		params.require(:current_order).permit(:status)
	end
end
