class FilmingLocationsMovie < ApplicationRecord
  belongs_to :filming_location
  belongs_to :movie
end
