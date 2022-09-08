class ProfilePhoto < ApplicationRecord
  belongs_to :business
  mount_uploader :photo1, Photo1Uploader
  mount_uploader :photo2, Photo2Uploader
  mount_uploader :photo3, Photo3Uploader
  mount_uploader :photo4, Photo4Uploader
  mount_uploader :photo5, Photo5Uploader
end
