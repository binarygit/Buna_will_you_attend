class Event < ApplicationRecord
  belongs_to :user

  validates :title, :date, :venue, presence: true
  validates :description, presence: true, length: {minimum: 20}

  scope :upcoming, -> { where("Date >= ?", Date.today) }
end
