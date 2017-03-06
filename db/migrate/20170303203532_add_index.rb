class AddIndex < ActiveRecord::Migration[5.0]
  def up
		execute %{
			CREATE VIEW addresses_with_states AS
				SELECT
				addresses.id,
				addresses.street,
				addresses.city,
				states.code AS state,
				addresses.zipcode
				FROM
				addresses
				JOIN states ON states.id = addresses.state_id;
		}
	end
end