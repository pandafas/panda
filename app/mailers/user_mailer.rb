class UserMailer < ApplicationMailer
	default from: "gritngrain08@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => "gritngrain08@gmail.com",
			:subject => "A new contact form message from #{name}")
	end
end
