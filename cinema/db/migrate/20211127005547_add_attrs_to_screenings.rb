class AddAttrsToScreenings < ActiveRecord::Migration[6.1]
  def change
    add_column :screenings, :first_day, :date, null: false
    add_column :screenings, :last_day, :date, null: false
    add_reference :screenings, :room, index: true
    add_reference :screenings, :movie, index: true
  end
end
