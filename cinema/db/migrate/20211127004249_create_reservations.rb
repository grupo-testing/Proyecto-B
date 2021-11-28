class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :user_name, null: false

      t.timestamps
    end
  end
end
