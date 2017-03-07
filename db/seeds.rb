# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create 50 Address
50.times do |i|
	Address.create(
		street: Faker::Address.street_name,
		city: Faker::Address.city,
		state_id: i,
		zipcode: Faker::Address.zip_code)
end

#Create 350.000 customers
350_000.times do |i|
	Customer.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		username: "#{Faker::Internet.user_name}#{i}",
		email: Faker::Internet.user_name + i.to_s + "@#{Faker::Internet.domain_name}")
end

#Create 50 states
State.create!(name: "Alabama" , code: "AL")
State.create!(name: "Alaska" , code: "AK")
State.create!(name: "Arizona" , code: "AZ")
State.create!(name: "Arkansas" , code: "AR")
State.create!(name: "California" , code: "CA")
State.create!(name: "Colorado" , code: "CO")
State.create!(name: "Connecticut" , code: "CT")
State.create!(name: "Delaware" , code: "DE")
State.create!(name: "Dist. of Columbia" , code: "DC")
State.create!(name: "Florida" , code: "FL")
State.create!(name: "Georgia" , code: "GA")
State.create!(name: "Hawaii" , code: "HI")
State.create!(name: "Idaho" , code: "ID")
State.create!(name: "Illinois" , code: "IL")
State.create!(name: "Indiana" , code: "IN")
State.create!(name: "Iowa" , code: "IA")
State.create!(name: "Kansas" , code: "KS")
State.create!(name: "Kentucky" , code: "KY")
State.create!(name: "Louisiana" , code: "LA")
State.create!(name: "Maine" , code: "ME")
State.create!(name: "Maryland" , code: "MD")
State.create!(name: "Massachusetts" , code: "MA")
State.create!(name: "Michigan" , code: "MI")
State.create!(name: "Minnesota" , code: "MN")
State.create!(name: "Mississippi" , code: "MS")
State.create!(name: "Missouri" , code: "MO")
State.create!(name: "Montana" , code: "MT")
State.create!(name: "Nebraska" , code: "NE")
State.create!(name: "Nevada" , code: "NV")
State.create!(name: "New Hampshire" , code: "NH")
State.create!(name: "New Jersey" , code: "NJ")
State.create!(name: "New Mexico" , code: "NM")
State.create!(name: "New York" , code: "NY")
State.create!(name: "North Carolina" , code: "NC")
State.create!(name: "North Dakota" , code: "ND")
State.create!(name: "Ohio" , code: "OH")
State.create!(name: "Oklahoma" , code: "OK")
State.create!(name: "Oregon" , code: "OR")
State.create!(name: "Pennsylvania" , code: "PA")
State.create!(name: "Rhode Island" , code: "RI")
State.create!(name: "South Carolina" , code: "SC")
State.create!(name: "South Dakota" , code: "SD")
State.create!(name: "Tennessee" , code: "TN")
State.create!(name: "Texas" , code: "TX")
State.create!(name: "Utah" , code: "UT")
State.create!(name: "Vermont" , code: "VT")
State.create!(name: "Virginia" , code: "VA")
State.create!(name: "Washington" , code: "WA")
State.create!(name: "West Virginia" , code: "WV")
State.create!(name: "Wisconsin" , code: "WI")

#Helper method to create a billing address for a customer
def create_billing_address(customer_id,num_states)
	billing_state = State.all[rand(num_states)]
	billing_address = Address.create!(
			street: Faker::Address.street_address,
			city: Faker::Address.city,
			state: billing_state,
			zipcode: Faker::Address.zip
		)

	CustomersBillingAddress.create!(customer_id: customer_id, address: billing_address)
end

#Helper method to create a shiping addres for a customer
def create_shipping_address(customer_id,num_states,is_primary)
	shipping_state = State.all[rand(num_states)]
	shipping_address = Address.create!(
			street: Faker::Address.street_address,
			city: Faker::Address.city,
			state: shipping_state,
			zipcode: Faker::Address.zip
		)

	CustomersShippingAddress.create!(customer_id: customer_id, address: shipping_address, primary: is_primary)
end

#Guardar en caché el numero de resultado para que no se deba consultar
num_states = State.all.count

#Para todos los clientes
Customer.all.pluck(:id).each do |customer_id|

	#Crea un -> billing address para cada uno de los clientes
	create_billing_address(customer_id,num_states)

	#Crea aleatoreamente -> shipping addresses,
	#Seguro que se crea almenos uno
	num_shipping_addresses = rand(4) + 1

	num_shipping_addresses.times do |i|
		#Crea el -> shipping address, settiando el primero
		#crearemos como "primary"
		create_shipping_address(customer_id,num_states, i == 0)
	end

end