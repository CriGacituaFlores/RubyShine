class Customer < ApplicationRecord

	has_many :customers_shipping_address

	def primary_shipping_address
		self.customers_shipping_address.find_by(primary: true).address
	end

	has_one :customers_billing_address
	has_one :billing_address, through: :customers_billing_address, source: :address

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
