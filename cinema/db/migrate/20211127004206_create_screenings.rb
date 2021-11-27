class CreateScreenings < ActiveRecord::Migration[6.1]
  def change
    create_table :screenings do |t|
      t.integer :schedule

      t.timestamps
    end
  end
end
