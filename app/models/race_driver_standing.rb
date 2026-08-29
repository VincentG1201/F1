class RaceDriverStanding < ApplicationRecord
  belongs_to :race
  belongs_to :driver
end