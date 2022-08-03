class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, default: 'Enter a company name'
      t.string :address, default: 'Enter a location'
      t.string :email, default: 'Enter an email'
      t.string :phone, default: 0
      t.string :description, default: 'describe your services'
      t.string :category, default: 'choose a category'
      t.decimal :pricing, default: 0
      t.timestamps
    end
  end
end
