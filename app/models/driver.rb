class Driver < ApplicationRecord
  belongs_to :nationality_country, class_name: "Country", foreign_key: "nationality_country_id", optional: true

  has_many :race_results
  has_many :qualifying_results
  has_many :race_driver_standings
  has_many :season_driver_standings
  has_many :season_drivers
end