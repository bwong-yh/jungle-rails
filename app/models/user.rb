class User < ApplicationRecord
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/, message: "must be a valid email address."}, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials (email, password)   
    # look for user in db
    @user = User.find_by_email(email.downcase)
    # if current user found and user password is authenticated return current user
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
