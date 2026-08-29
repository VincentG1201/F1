class SeasonConstructor < ApplicationRecord
  belongs_to :season, foreign_key: :year
  belongs_to :constructor
end