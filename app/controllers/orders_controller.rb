class OrdersController < ApplicationController
	before_filter :authenticate_user!

	def index
		@orders = Order.all

	end

	def show
		#@orders = orders.find(@user.id)
		#foreach @orders
			#@product = Product.find(@order.product_id)
			#puts product_details for order


	end

	def new
		@order = Order.new
	end

	#def create
		#@order = Order.new(order_params)

		#respond_to do |format|
      		#if order.save
        		#format.html { redirect_to @order, notice: 'Your order was successfully created.' }
        		#format.json { render :show, status: :created, location: @order }
      		#else
        		#format.html { render :new }
        		#format.json { render json: @order.errors, status: :unprocessable_entity }
      		#end
    	#end
	#end

	def destroy
	end
end