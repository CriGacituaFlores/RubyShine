class CustomerDetail < ActiveRecord::Base
	#SE USA SELF PRIMARY KEY YA QUE LA VISTA NO TIENE UN CAMPO LLAMADO 'ID'
	self.primary_key = 'customer_id'
end