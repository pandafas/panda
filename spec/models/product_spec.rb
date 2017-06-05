require 'rails_helper'

describe Product do
	before do
		@product = Product.create!(name: "wood sign", description: "wood sign", colour: "black", price: "45", category: "Signs", image_url: "wood_sign.jpg")
		@user = User.create!(email: "natertot@gmail.com", password: "natertot")
		@product.comments.create!(rating: 1, user: @user, body: "Ugly sign")
		@product.comments.create!(rating: 3, user: @user, body: "OK quality")
		@product.comments.create!(rating: 5, user: @user, body: "Beautiful product")
	end
	context "when the product has comments" do
		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
		end
	end
end

