class AddAttrsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :img, :string, null: false
  end
end
