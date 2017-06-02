class OrdersController < ApplicationController
	before_filter :authenticate_user!

	def index
	end

	def show
		#@orders = orders.find(@user.id)
		#foreach @orders
			#@product = Product.find(@order.product_id)
			#puts product_details for order


	end

	def new
	end

	def create
	end

	def destroy
	end
end