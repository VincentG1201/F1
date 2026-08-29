# app/controllers/drivers_controller.rb
class DriversController < ApplicationController
  def index
    @years = Season.order(year: :desc).pluck(:year)
    @year = (params[:year] || Season.maximum(:year)).to_i

    @season_drivers = SeasonDriver.where(year: @year)
                                   .where("total_race_starts > 0")
                                   .includes(driver: :nationality_country)
                                   .order(total_points: :desc)

    driver_ids = @season_drivers.map(&:driver_id)
    @current_teams = RaceResult.joins(:race)
                                .where(races: { year: @year }, driver_id: driver_ids)
                                .order(:race_id)
                                .group_by(&:driver_id)
                                .transform_values { |results| results.last.constructor }
  end
end