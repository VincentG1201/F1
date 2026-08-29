class Race < ApplicationRecord
  belongs_to :grand_prix
  belongs_to :circuit

  has_many :race_results
  has_many :qualifying_results
  has_many :starting_grid_positions
  has_many :fastest_laps
  has_many :pit_stops
  has_many :race_driver_standings
  has_many :race_constructor_standings
end