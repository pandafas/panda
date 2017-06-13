class PaymentsController < ApplicationController
	before_action :authenticate_user!

	def create

		@product = Product.find(params[:product_id])
		
		if user_signed_in?
			@user = current_user
		end
		token = params[:stripeToken]
		
		begin
			charge = Stripe::Charge.create(
				amount: @product.price*100,
				currency: "usd",
				source: token,
				description: @product.description,
				receipt_email: @user.email
			)

				if charge.paid
					Order.create(
						product_id: params[:product_id],
						user_id: @user.id,
						total: @product.price
					)
				end
		rescue Stripe::CardError => e
			body = e.json_body
			err = body[:error]
			flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		end

		redirect_to product_path(@product)
		flash[:notice] = "Thank you for purchasing #{@product.name}"
	end

end
