class CustomersController < ApplicationController

	def index
		@customers = Customer.all.limit(30)
	end

end