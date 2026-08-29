class SeasonDriverStanding < ApplicationRecord
    belongs_to :season, foreign_key: :year
    belongs_to :driver
end