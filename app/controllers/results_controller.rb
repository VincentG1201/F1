class ResultsController < ApplicationController
  def index
    @years = Season.order(year: :desc).pluck(:year)
    @view = params[:view] == "qualifying" ? "qualifying" : "result"


    if params[:id].present?
      @race = Race.includes(:grand_prix, circuit: :country).find(params[:id])
    elsif params[:year].present?
      @race = Race.where(year: params[:year]).where("date < ?", Date.current)
                  .includes(:grand_prix, circuit: :country).order(:round).last
    else
      @race = Race.where("date < ?", Date.current)
                  .includes(:grand_prix, circuit: :country).order(date: :desc).first
    end

    return unless @race

    @year = @race.year
    @season_races = Race.where(year: @year).where("date < ?", Date.current)
                         .includes(:grand_prix).order(:round)

    @results = @race.race_results.includes(:driver, :constructor).order(:position_display_order)
    @qualifying = @race.qualifying_results.includes(:driver, :constructor).order(:position_display_order)
  end
end