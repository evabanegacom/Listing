class AddFieldsToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :state, :string, default: 'Lagos'
    add_column :businesses, :state, :string, default: 'Lagos'
  end
end
