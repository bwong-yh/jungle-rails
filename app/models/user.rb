class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/, message: "must be a valid email address."}, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
