class Movie < ApplicationRecord
  has_many :screenings
  validates :name, presence: true
  validates :img, presence: true
end
