class CountriesMovie < ApplicationRecord
  belongs_to :country
  belongs_to :movie
end
