require 'rails_helper'

describe ProductsController, type: :controller do

	before do
		@product = FactoryGirl.create(:product)
	end

	context 'GET #index' do
		
		it 'user clicks on show' do
			get :show, params: { id: @product.id }
			expect(response).to be_ok
		end
	end
end