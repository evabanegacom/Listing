class CreateProfilePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_photos do |t|
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
