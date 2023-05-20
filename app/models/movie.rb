class Movie < ApplicationRecord
  #Relations -------------------------------
  has_many :reviews
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :filming_locations

  #Validations -----------------------------
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :year, presence: true
  validates :director, presence: true
end
