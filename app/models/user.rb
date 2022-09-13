class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/, message: "must be a valid email address."}
  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
