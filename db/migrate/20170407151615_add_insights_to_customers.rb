class AddInsightsToCustomers < ActiveRecord::Migration[5.0]
  def change
  	add_column :customers, :insights, :json, default: {}
  end
end
