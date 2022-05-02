class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 100}
end
