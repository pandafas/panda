require 'rails_helper'

describe ProductsController, type: :controller do

	before do
		@product = FactoryGirl.create(:product, name: "Wood 1")
		@product = FactoryGirl.create(:product, name: "Wood 2")
	end


	context 'GET #index' do
		it 'responds successfully with an HTTP 200 status code' do
      	expect(response).to be_success
      	expect(response).to have_http_status(200)
      	end
    end

	context 'GET #show' do
		it 'user clicks on show' do
			get :show, params: { id: @product.id }
			expect(response).to be_ok
			expect(response).to render_template('show')
		end
	end

	context 'GET #new' do
		it 'user adds a new product' do
			get :new
			expect(assigns(:product)).to be_a_new(Product)
		end

		it 'renders the new product template' do
			get :new 
			expect(response).to render_template :new
		end
	end


	context 'POST #create' do
		before do
			@product = FactoryGirl.create(:product)
		end

		it 'user creates a new product with all fields and saves it to the database' do
			expect{ post :create, params: {product: attributes_for(:product)}}
			expect(response).to be_ok
		end
	end

	context 'POST #create' do
		before do
			@product = FactoryGirl.build(:product, name: "")
		end

		it 'user creates a new product with invalid or missing attributes' do
			expect(@product).not_to be_valid
		end
	end

	context 'PUT #update' do
		before do 
			@product = FactoryGirl.create(:product)
			@user = FactoryGirl.build(:admin)
			sign_in @user
		end

		it "successfully updates product price" do
      		@attr = { :name => @product.name, :image_url => @product.image_url, :id => @product.id, :price => "35" }
      		put :update, params: { :id => @product.id, :product => @attr }
      		@product.reload
      		expect(@product.price).to eq 35
    	end
	end

	context "DELETE #destroy" do
		before do
      		@product = FactoryGirl.create(:product)
      		@user = FactoryGirl.build(:admin)
      		sign_in @user
    	end

    	it "should allow admin to delete product" do
      		expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
    	end
  	end
end