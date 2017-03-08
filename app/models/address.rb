class Address < ApplicationRecord
	belongs_to :state
	has_many :customers_billing_addresses

	after_touch :log_when_address_touched

	private
	def log_when_address_touched
		"Address was touched!"
	end
end
