FactoryGirl.define do
	sequence (:product) { |n| "product#{n}" }
	sequence (:comment) { |n| "comment#{n}" }

	factory :product do
		name "Wood Sign"
		description "A wood sign."
		image_url "woodsign.jpg"
		colour "Dark Cherry"
		price "25"
		category "Signs"
	end

	factory :comment do
		user_id "1"
		body "Great Product"
		rating "5"
		product_id "1"
	end
end