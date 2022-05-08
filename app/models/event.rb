class Event < ApplicationRecord
  belongs_to :user

  validates :title, :date, presence: true
  validates :description, presence: true, length: {minimum: 20}
end
