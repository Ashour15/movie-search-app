class CreateJoinTableMovieFilmingLocation < ActiveRecord::Migration[6.1]
  def change
    create_join_table :movies, :filming_locations do |t|
      t.index :movie_id
      t.index :filming_location_id
    end
  end
end
