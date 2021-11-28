class Movie < ApplicationRecord
  has_many :screenings
  validates :name, presence: true, uniqueness: true
  validates :img, presence: true
end
