# app/controllers/standings_controller.rb
class StandingsController < ApplicationController
  def index
    @years = Season.order(year: :desc).pluck(:year)
    @type = params[:type] == "teams" ? "teams" : "drivers"
    @year = (params[:year] || Season.maximum(:year)).to_i

    if @type == "drivers"
      @standings = SeasonDriverStanding.where(year: @year)
                                        .includes(driver: :nationality_country)
                                        .order(:position_display_order)

      driver_ids = @standings.map(&:driver_id)
      @current_teams = RaceResult.joins(:race)
                                  .where(races: { year: @year }, driver_id: driver_ids)
                                  .order(:race_id)
                                  .group_by(&:driver_id)
                                  .transform_values { |results| results.last.constructor }
    else
      @standings = SeasonConstructorStanding.where(year: @year).includes(:constructor).order(:position_display_order)
    end
  end
end