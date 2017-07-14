FactoryGirl.define do 
	sequence (:email) { |n| "user#{n}@example.com" }
	sequence (:id) { |n| "100{n}"}

	factory :user do
		id
		email 
		password "1234567890"
		first_name "User1"
		last_name "Example"
		admin false
	end	

	factory :admin, class: User do
		id
		email 
		password "qwertyuiop"
		admin true
		first_name "Admin"
		last_name "User"
	end
end
