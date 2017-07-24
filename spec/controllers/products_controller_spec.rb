require 'rails_helper'

describe ProductsController, type: :controller do

	before do
		@product = FactoryGirl.create(:product, category: 'Signs', name: "Wood 1", colour: 'Dark Cherry')
	end
	context 'GET #index' do
		it 'responds successfully with an HTTP 200 status code' do
      		get :index
      		expect(response).to be_success
      		expect(response).to have_http_status(200)
      	end
    end
	context 'GET #index with query' do
    	it 'returns matching result of the query' do
    		get :index, params: {q: "wood"}
    		expect(response).to be_ok
    		expect(assigns(:products)).to match(Product.search("wood").group_by(&:category))
    	end
    end
	context 'GET #index without query' do
    	it 'returns all products with a category' do
    		get :index
    		expect(response).to be_ok
    		expect(assigns(:products)).to match(Product.where('category is not null').group_by(&:category))
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
			expect{
          	post :create, params: {product: FactoryGirl.attributes_for(:product)}
        	}.to change(Product, :count).by(1)
      end
	end
	context 'POST #create' do
		before do
			@product = FactoryGirl.build(:product, name: "")
		end

		it 'user creates a new product with invalid or missing attributes' do
			expect{
          post :create, params: {product: FactoryGirl.attributes_for(:product, name: nil)}
        }.not_to change(Product, :count)

		end
	end
	context 'PUT #update' do
		before do 
			@product = FactoryGirl.create(:product)
			@user = FactoryGirl.build(:admin)
			sign_in @user
		end

		it "does not edit product with invalid info" do
			@attr = { :name => nil, :image_url => @product.image_url, :id => @product.id, :price => nil }
			put :update, params: {:id => @product.id, :product => @attr}
        	expect(response).to render_template :edit
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