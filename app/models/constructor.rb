class Constructor < ApplicationRecord
  belongs_to :country

  has_many :race_results
  has_many :qualifying_results
  has_many :race_constructor_standings
  has_many :season_constructor_standings
  has_many :season_constructors
end