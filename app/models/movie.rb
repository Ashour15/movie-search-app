class Movie < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :filming_locations
end
