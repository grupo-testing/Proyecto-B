class Screening < ApplicationRecord
  has_many :movies
  has_many :rooms
  has_many :reservations
end
