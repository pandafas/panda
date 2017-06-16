class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    byebug
    @featured_product = Product.first
    @products = Product.limit(4)
  end	

  def thank_you
    @contact_name = params[:contact_name]
    @contact_email = params[:contact_email]
    @contact_message = params[:contact_message]
    ActionMailer::Base.mail(:from => @contact_email, 
      :to => "gritngrain08@gmail.com",
      :subject => "A new contact form message from #{@contact_name}",
      :body => @contact_message).deliver_now
    UserMailer.contact_form(@contact_email, @contact_name, @contact_message).deliver_now
  end
end
