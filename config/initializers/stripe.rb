if Rails.env.production?
	Rails.configuration.stripe = {
		publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
		secret_key: ENV['STRIPE_SECRET_KEY']
	}
else 
	Rails.configuration.stripe = {
		publishable_key: 'pk_test_90kJYUXS9YWFURrA60JwJtQS',
		secret_key: 'sk_test_f4UdWu7jBlP2DoCVnt1LYUea'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]