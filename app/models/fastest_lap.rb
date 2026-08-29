class FastestLap < ApplicationRecord
  belongs_to :race
  belongs_to :driver
  belongs_to :constructor
end