class Season < ApplicationRecord
  self.primary_key = "year"

  has_many :races, foreign_key: :year
  has_many :season_driver_standings, foreign_key: :year
  has_many :season_constructor_standings, foreign_key: :year
  has_many :season_drivers, foreign_key: :year
  has_many :season_constructors, foreign_key: :year
end