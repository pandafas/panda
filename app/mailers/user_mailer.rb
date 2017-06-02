class UserMailer < ApplicationMailer
	default from: "gritngrain08@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => "gritngrain08@gmail.com",
			:subject => "A new contact form message from #{name}")
	end

	
	def send_welcome_email(email)
		@message = message
		mail(:to => "#{email}",
			:subject => "Welcome to Grit & Grain!",
			:body => "Welcome to the wonderful world of Grit & Grain.  Thank you for signing up.")
	end
		
end
