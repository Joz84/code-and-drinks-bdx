class CityQuarter < ApplicationRecord
  has_many :users
  has_many :games, through: :users
  has_many :rounds
  
end
