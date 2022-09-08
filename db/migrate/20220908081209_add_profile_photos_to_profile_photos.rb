class AddProfilePhotosToProfilePhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :profile_photos, :photo1, :string
    add_column :profile_photos, :photo2, :string
    add_column :profile_photos, :photo3, :string
    add_column :profile_photos, :photo4, :string
    add_column :profile_photos, :photo5, :string
  end
end
