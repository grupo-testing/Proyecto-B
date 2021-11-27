class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :room
  has_many   :reservations
  validates  :first_day, presence: true
  validates  :last_day,  presence: true
  validates  :schedule,  presence: true
  # validate :custom_validation

  private 
  
  def custom_validation
    if ! (valid...)
      self.errors[:base] << "Custom error message"
    end
  end
end
