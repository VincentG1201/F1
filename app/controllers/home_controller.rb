class HomeController < ApplicationController
  def index
    # simplifed schedule table: grand_prix_name, date, then color (done or not done yet)
    # current driver standing: driver_name, total_points
    # current team standing: team_name, total_points
    @year = Season.maximum(:year)
    
    season_races = Race.where(year: @year).includes(:grand_prix).order(:round)
    @next_race = season_races.where("Date >= ?", Date.current).first
    @schedule = season_races.to_a

    @driver_standings = SeasonDriverStanding.where(year: @year).includes(:driver).order(:position_display_order)
    @constructor_standings = SeasonConstructorStanding.where(year: @year).includes(:constructor).order(:position_display_order)
  end
end
