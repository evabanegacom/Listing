class ProfilePhotoSerializer < ActiveModel::Serializer
  attributes :id
  has_one :business
end
