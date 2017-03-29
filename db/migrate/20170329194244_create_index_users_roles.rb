class CreateIndexUsersRoles < ActiveRecord::Migration[5.0]
  def up
		execute %{
			CREATE INDEX
				users_roles
			ON
				users
			USING GIN (roles)
		}
	end
end
