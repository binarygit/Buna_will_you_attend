class User < ApplicationRecord
  has_secure_password
  belongs_to :access_level

  before_validation :set_access_level

  validates :username, :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, :access_level_id, presence: true

  private

  def set_access_level
    privileged ||= AccessLevel.find_by(name: 'privileged')
    ordinary ||= AccessLevel.find_by(name: 'ordinary')

    if email.eql?('buna@buna.com')
      self.access_level_id = privileged.id
    else
      self.access_level_id = ordinary.id
    end
  end
end
