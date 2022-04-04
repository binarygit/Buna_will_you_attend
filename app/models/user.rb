class User < ApplicationRecord
  has_secure_password
  belongs_to :access_level

  validates :username, :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, :access_level_id, presence: true
end
