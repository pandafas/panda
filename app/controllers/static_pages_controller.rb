class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
    @products = Product.limit(4)
  end	

  def thank_you
    @contact_name = params[:contact_name]
    @contact_email = params[:contact_email]
    @contact_message = params[:contact_message]
    @submit_val = params[:commit]
    @msg = "Your message has been sent."
    ActionMailer::Base.mail(:from => @contact_email, 
      :to => "gritngrain08@gmail.com",
      :subject => "A new contact form message from #{@contact_name}",
      :body => @contact_message).deliver_now
    UserMailer.contact_form(@contact_email, @contact_name, @contact_message).deliver_now
    respond_to do |format|
      if @submit_val == 'Send'
        format.json { render json: @msg, status: :sent}
        format.js
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end 
    end
  end
end
