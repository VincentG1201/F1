class SchedulesController < ApplicationController
  def index
    @year = (params[:year] || Season.maximum(:year)).to_i
    @years = Season.order(year: :desc).pluck(:year)
    @races = Race.where(year: @year).includes(:grand_prix, circuit: :country).order(:round)

    race_ids = @races.map(&:id)
    @top3 = RaceResult.where(race_id: race_ids, position_number: [1, 2, 3])
                       .includes(:driver)
                       .order(:position_number)
                       .group_by(&:race_id)
  end
end