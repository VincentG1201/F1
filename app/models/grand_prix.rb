class GrandPrix < ApplicationRecord
    self.table_name = "grands_prix"
    belongs_to :country, optional: true
    has_many :races
end