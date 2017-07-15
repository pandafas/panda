require 'rails_helper'

describe ProductsController, type: :controller do

	before do
		@product = FactoryGirl.create(:product, name: "Wood 1")
		@product = FactoryGirl.create(:product, name: "Wood 2")
	#	@admin = FactoryGirl.create(:admin)

	end

	context 'GET #index' do
		
		it 'user clicks on show' do
			get :show, params: { id: @product.id }
			expect(response).to be_ok
		end
	end

	#context "with params[:q]" do
	#	it "populates an array matching the search param" do
	#		get :index, params: {q: "Wood"}
	#		expect(assigns(:products)).to match_array([wood])
	#	end
	#end

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
		it 'users creates a new product with all fields and saves it to the database' do
			expect{ post :create, params: {product: attributes_for(:product)}}
		end

		it 'redirects the user to the products#show page' do
			expect{ post :create, params: {product: attributes_for(:product)}}
		#	expect(response).to redirect_to(show_product_session_path)
		end

		it 'user creates new product with invalid attributes' do
			expect{post :create, params: {product: attributes_for(:product, name: nil)}}
		#	expect(response).to render_template :new
		end
	end

	context 'PUT #update' do
		it 'users updates a products attributes' do
			expect(flash[:notice]
	#		expect alert 'Product was successfully updated'
		end
	end
end