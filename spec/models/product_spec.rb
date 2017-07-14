require 'rails_helper'

describe Product do
	before do
		@product = FactoryGirl.create(:product)
		@user = FactoryGirl.create(:user)
		@product.comments.create!(rating: 1, user: @user, body: "Ugly sign")
		@product.comments.create!(rating: 3, user: @user, body: "OK quality")
		@product.comments.create!(rating: 5, user: @user, body: "Beautiful product")
		expect(Product.new(description: "purple wood round")).not_to be_valid
	end
	context "when the product has comments" do
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end
		it "returns the highest rating of all comments" do
			expect(@product.highest_rating_comment.rating).to eq 5
		end
		it "returns the lowest rating of all comments" do
			expect(@product.lowest_rating_comment.rating).to eq 1
		end
	end
	context "creates invalid product" do
		it "return is not valid" do
			expect(Product.new(description: "purple wood round")).not_to be_valid
		end
	end
	context "shows current amount of views" do
		it "shows the current value" do
			expect(@product.views).to be > '0'
		end
	end
	context "validates the attributes of the product" do
		it "shows all product attributes" do
			expect(@product).to have_attributes(:name => "Wood Sign", :description => "A wood sign.", :image_url => "woodsign.jpg", :colour => "Dark Cherry", :price => 25, :category => "Signs")
		end
	end
end

