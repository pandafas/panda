class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
	@featured_product = Product.first
  end

  def landing_page
	@featured_product = Product.first
  end

  def landing_page
  	@products = Product.limit(4)
  end	

  def thank_you
    @contact_name = params[:contact_name]
    @contact_email = params[:contact_email]
    @contact_message = params[:contact_message]
    ActionMailer::Base.mail(:from => @email, 
      :to => "gritngrain08@gmail.com",
      :subject => "A new contact form message from #{@contact_name}",
      :body => @contact_message).deliver_now
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
