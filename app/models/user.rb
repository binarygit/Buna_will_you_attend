class User < ApplicationRecord
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
