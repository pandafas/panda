class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders

	after_create :send_new_user_email
	def send_new_user_email
		UserMailer.send_new_user_message(@user).deliver
	end

  #private
  	#def welcome_message
  		#UserMailer.welcome_message(self).deliver
  	#end
end
