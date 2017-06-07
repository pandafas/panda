require 'rails_helper'

describe ProductsController, type: :controller do

	before do
		@product = Product.create!(name: "wood sign", image_url: "woodsign.jpg", description: "A sign made of wood", colour: "brown", price: "25", category: "signs")
	end

	context 'GET #index' do
		
		it 'user clicks on show' do
			get :show, params: { id: @product.id }
			expect(response).to be_ok
		end
	end
end