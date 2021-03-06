require 'rails_helper'

describe UsersController, type: :controller do

	before do
		@user1 = FactoryGirl.create(:user)
	  	
	 end

  	describe 'GET #show' do
		
		context 'when a user is logged in' do

			before do
				sign_in @user1
			end

	     	it 'loads correct user details' do
	     		get :show, params: { id: @user1.id }
	     		expect(response).to be_ok
	     		expect(assigns(:user)).to eq @user1
	     	end

	     	#it 'cannot access any other user details' do
	    	#	get :show, params: {id: @user2.id}
	    	#	expect(response).to redirect_to(root_path)
	    	#end
	    end
	  
	  	before do
	  			sign_out @user1
	  		end

	    context 'when a user is not logged in' do
	       it 'redirects to login' do
	         get :show, params: { id: @user1.id }
	         expect(response).to redirect_to(new_user_session_path)
	       end
	    end
	end 
end
