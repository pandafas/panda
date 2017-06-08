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
	end
	context "creates invalid product"do
		it "return is not valid" do
			expect(Product.new(description: "purple wood round")).not_to be_valid
		end
	end

	
end

