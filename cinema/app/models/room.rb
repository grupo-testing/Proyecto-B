class Room < ApplicationRecord
  has_many :screenings

  ROOMS = %i[sala1 sala2 sala3 sala4 sala5 sala6 sala7 sala8]
end
