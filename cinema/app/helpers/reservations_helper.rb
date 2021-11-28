module ReservationsHelper
  def get_seat_label(seat)
    number = seat%12 == 0 ? 12 : seat%12 
    if seat <= 12
      "A-#{number}"
    elsif seat <= 24
      "B-#{number}"
    elsif seat <= 36
      "C-#{number}"
    elsif seat <= 48
      "D-#{number}"
    end
  end
end
