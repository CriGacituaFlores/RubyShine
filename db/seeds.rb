# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
	Address.create(
		street: Faker::Address.street_name,
		city: Faker::Address.city,
		state_id: i,
		zipcode: Faker::Address.zip_code)
end

350_000.times do |i|
	Customer.create!(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		username: "#{Faker::Internet.user_name}#{i}",
		email: Faker::Internet.user_name + i.to_s + "@#{Faker::Internet.domain_name}")
end

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