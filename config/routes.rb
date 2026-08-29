# config/routes.rb
Rails.application.routes.draw do
  root "home#index"

  get "schedule", to: "schedules#index", as: :schedule
  get "schedule/:year", to: "schedules#index", as: :schedule_season, constraints: { year: /\d{4}/ }

  get "result", to: "results#index", as: :results

  get "standings", to: "standings#index", as: :standings

  get "drivers", to: "drivers#index", as: :drivers
  get "drivers/:year", to: "drivers#index", as: :drivers_season, constraints: { year: /\d{4}/ }

  get "teams", to: "constructors#index", as: :constructors
  get "teams/:year", to: "constructors#index", as: :constructors_season, constraints: { year: /\d{4}/ }
end