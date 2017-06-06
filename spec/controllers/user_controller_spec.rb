require 'rails_helper'

describe UserController, type: :controller do 
#	before do
#		@user = User.create!(email: "natertot@gmail.com", password: "natertot")
#		@sign_in = User.sign_in
#	end
	let(:user) { User.create!(email: 'natertot@gmail.com', password: 'natertot')}

	describe 'GET #show' do
		context 'User is logged in' do
			before do
				sign_in user
			end
		it 'loads correct user details'
			get :show, id: user.id
			expect(response).to have_http_status(200)
			expect(assigns(.user)).to eq user

		end

		context 'No user is logged in' do
			it 'redirects to login' do
				get :show, id: user.id
				expect(response).to redirect_to(root_path)
			end	
		end
	end
end