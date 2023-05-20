class Review < ApplicationRecord
  #Relations -------------------------------
  belongs_to :user
  belongs_to :movie
  
  #Validations -----------------------------
  validates :stars, presence: true, inclusion: { in: 1..5 }
end