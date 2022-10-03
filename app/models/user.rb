class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
    has_many :businesses, dependent: :destroy
    validates :name, presence: true
  # validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
    def as_json(options = {})
        super(options.merge({ except: %i[password_digest created_at updated_at] }))
    end
end
