class Customer < ApplicationRecord

	after_touch :log_when_customer_touched
	after_destroy :log_destroy_action

	def full_name
		"#{first_name} #{last_name}"
	end

	private

	def log_when_customer_touched
		puts "CUSTOMER WAS TOUCHED"
	end

	def log_destroy_action
		puts "Customer destroyed"
	end

end
