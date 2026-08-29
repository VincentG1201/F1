# app/controllers/constructors_controller.rb
class ConstructorsController < ApplicationController
  def index
    @years = Season.order(year: :desc).pluck(:year)
    @year = (params[:year] || Season.maximum(:year)).to_i

    @season_constructors = SeasonConstructor.where(year: @year)
                                             .where("total_race_starts > 0")
                                             .includes(constructor: :country)
                                             .order(total_points: :desc)
  end
end