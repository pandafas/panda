class Order < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates :total, presence: true,
						numericality: { greater_than_or_equal_to: 0 }
	validates :user_id, presence: true		
end