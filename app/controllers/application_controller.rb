class ApplicationController < ActionController::Base
	before_action :set_current_order

	def set_current_order
		if session["current_order_id"]
			@current_order = Order.find(session["current_order_id"])
		else
			@current_order = Order.create(status: "draft")
			session["current_order_id"] = @current_order.id
		end
	end
end
