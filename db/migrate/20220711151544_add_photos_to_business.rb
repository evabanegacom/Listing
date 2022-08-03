class AddPhotosToBusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :cover_photo, :string
    add_column :businesses, :profile_photo, :string
  end
end