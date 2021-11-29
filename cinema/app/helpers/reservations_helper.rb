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
  
  def get_schedule_label(schedule)
    if schedule == 0
      "Matine | 17:00 - 19:00"
    elsif schedule == 1
      "Tanda | 19:00 - 21:00"
    else schedule == 2
      "Tanda | 21:00 - 23:00"
    end
  end
end
