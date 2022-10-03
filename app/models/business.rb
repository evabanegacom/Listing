class Business < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_one :profile_photo
  #mount_uploader :profile_photo, ProfilePhotoUploader
  mount_uploader :cover_photo, CoverPhotoUploader
  paginates_per 25
  # def self.search(search)
  #   where("lower(businesses.name) LIKE search OR lower(businesses.description) LIKE :search 
  #   OR lower(businesses.category) LIKE :search ", search: "%#{search.downcase}%").uniq
  # end
end
