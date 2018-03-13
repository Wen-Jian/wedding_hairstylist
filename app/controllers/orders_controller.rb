class OrdersController < ApplicationController

	before_action  :authenticate_user!
	def new

		@service = User.find_by(id: params[:service_id])
		
	end

	def create

		@sell = Order.new()

		@sell.customer_id = params[:order][:customer]
		@sell.seller_id = params[:order][:service_id]
		@sell.price = params[:order][:price]

		if @sell.save

			redirect_to orders_path
			d

		else

			render :new

		end
		
	end

	private

	def orders_params
		
		params.require(:order).permit(:customer, :service_id, :price)

	end
end
