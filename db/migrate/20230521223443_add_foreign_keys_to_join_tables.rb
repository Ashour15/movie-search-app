class AddForeignKeysToJoinTables < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :actors_movies, :actors
    add_foreign_key :actors_movies, :movies

    add_foreign_key :countries_movies, :countries
    add_foreign_key :countries_movies, :movies

    add_foreign_key :filming_locations_movies, :filming_locations
    add_foreign_key :filming_locations_movies, :movies
  end
end
