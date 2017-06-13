class PaymentsController < ApplicationController
	before_action :authenticate_user!

	def create

		@product = Product.find(params[:product_id])
		if user_signed_in?
			@user = current_user
		end
		token = params[:stripeToken]
		#Create the charge on Stripe's servers - this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				amount: @product.price*100,
				currency: "usd",
				source: token,
				description: @product.description,
				receipt_email: params[:stripeEmail]
			)
		rescue Stripe::CardError => e
			# the card has been declined
		end

		redirect_to product_path(@product)
	end
end
