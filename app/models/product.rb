class Product < ApplicationRecord
	has_many :orders
	has_many :comments

	def self.search(search_term)
		Product.where("name LIKE ?", "%#{search_term}%")
	end

	def highest_rating_comment
		comments.order(rating: :desc).limit(1).pluck(:rating)
	end

	def lowest_rating_comment
		comments.order(rating: :asc).limit(1).pluck(:rating)
	end

	def average_rating
		comments.average(:rating).to_f
	end


end


