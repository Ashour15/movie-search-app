class AddAverageStarsToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :average_stars, :float
  end
end
