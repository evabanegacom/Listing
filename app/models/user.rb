class User < ApplicationRecord
    has_secure_password
    has_many :businesses, dependent: :destroy
    validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
    def as_json(options = {})
        super(options.merge({ except: %i[password_digest created_at updated_at] }))
    end
end
