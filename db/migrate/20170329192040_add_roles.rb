class AddRoles < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :roles, :string, array: true, default: []
  end
end
