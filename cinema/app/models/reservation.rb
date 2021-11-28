class Reservation < ApplicationRecord
  belongs_to :screening
  validates :user_name, presence: true
  validates :seat_number, presence: true
  validates :date, presence: true
end
