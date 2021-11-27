class AddAttrsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :seat_number, :integer, null: false
    add_reference :reservations, :screening, index: true
  end
end
