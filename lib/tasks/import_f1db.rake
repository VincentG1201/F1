namespace :f1db do
  desc "Import F1DB CSV data (Day 1 core tables + Day 2 results/standings tables)"
  task import: :environment do
    require "csv"

    CSV_DIR = Rails.root.join("db", "f1db_csv")

    def load_csv(filename)
      path = CSV_DIR.join(filename)
      unless File.exist?(path)
        puts "  SKIP (file not found): #{filename}"
        return []
      end
      CSV.read(path, headers: true, encoding: "UTF-8")
    end

    def to_bool(val)
      val == "true"
    end

    def blank_to_nil(val)
      val.nil? || val == "" ? nil : val
    end

    # ---------- DAY 1: reference tables ----------

    puts "Importing continents..."
    load_csv("f1db-continents.csv").each do |row|
      Continent.find_or_initialize_by(id: row["id"]).update!(
        code: row["code"], name: row["name"], demonym: blank_to_nil(row["demonym"])
      )
    end

    puts "Importing countries..."
    load_csv("f1db-countries.csv").each do |row|
      Country.find_or_initialize_by(id: row["id"]).update!(
        alpha2_code: row["alpha2Code"], alpha3_code: row["alpha3Code"],
        ioc_code: blank_to_nil(row["iocCode"]), name: row["name"],
        demonym: blank_to_nil(row["demonym"]), continent_id: row["continentId"]
      )
    end

    puts "Importing circuits..."
    load_csv("f1db-circuits.csv").each do |row|
      Circuit.find_or_initialize_by(id: row["id"]).update!(
        name: row["name"], full_name: row["fullName"],
        previous_names: blank_to_nil(row["previousNames"]),
        circuit_type: blank_to_nil(row["type"]), direction: blank_to_nil(row["direction"]),
        place_name: row["placeName"], country_id: row["countryId"],
        latitude: blank_to_nil(row["latitude"]), longitude: blank_to_nil(row["longitude"]),
        length: blank_to_nil(row["length"]), turns: blank_to_nil(row["turns"]),
        total_races_held: row["totalRacesHeld"].to_i
      )
    end

    puts "Importing grands_prix..."
    load_csv("f1db-grands-prix.csv").each do |row|
      GrandPrix.find_or_initialize_by(id: row["id"]).update!(
        name: row["name"], full_name: row["fullName"], short_name: row["shortName"],
        abbreviation: row["abbreviation"], country_id: blank_to_nil(row["countryId"]),
        total_races_held: row["totalRacesHeld"].to_i
      )
    end

    puts "Importing drivers..."
    load_csv("f1db-drivers.csv").each do |row|
      Driver.find_or_initialize_by(id: row["id"]).update!(
        name: row["name"], first_name: row["firstName"], last_name: row["lastName"],
        full_name: row["fullName"], abbreviation: row["abbreviation"],
        permanent_number: blank_to_nil(row["permanentNumber"]), gender: blank_to_nil(row["gender"]),
        date_of_birth: blank_to_nil(row["dateOfBirth"]), date_of_death: blank_to_nil(row["dateOfDeath"]),
        place_of_birth: blank_to_nil(row["placeOfBirth"]),
        country_of_birth_country_id: blank_to_nil(row["countryOfBirthCountryId"]),
        nationality_country_id: blank_to_nil(row["nationalityCountryId"]),
        second_nationality_country_id: blank_to_nil(row["secondNationalityCountryId"]),
        best_championship_position: blank_to_nil(row["bestChampionshipPosition"]),
        best_starting_grid_position: blank_to_nil(row["bestStartingGridPosition"]),
        best_race_result: blank_to_nil(row["bestRaceResult"]),
        best_sprint_race_result: blank_to_nil(row["bestSprintRaceResult"]),
        total_championship_wins: row["totalChampionshipWins"].to_i,
        total_race_entries: row["totalRaceEntries"].to_i,
        total_race_starts: row["totalRaceStarts"].to_i,
        total_race_wins: row["totalRaceWins"].to_i,
        total_race_laps: row["totalRaceLaps"].to_i,
        total_podiums: row["totalPodiums"].to_i,
        total_points: row["totalPoints"].to_f,
        total_championship_points: row["totalChampionshipPoints"].to_f,
        total_pole_positions: row["totalPolePositions"].to_i,
        total_fastest_laps: row["totalFastestLaps"].to_i,
        total_sprint_race_starts: row["totalSprintRaceStarts"].to_i,
        total_sprint_race_wins: row["totalSprintRaceWins"].to_i,
        total_driver_of_the_day: row["totalDriverOfTheDay"].to_i,
        total_grand_slams: row["totalGrandSlams"].to_i
      )
    end

    puts "Importing constructors..."
    load_csv("f1db-constructors.csv").each do |row|
      Constructor.find_or_initialize_by(id: row["id"]).update!(
        name: row["name"], full_name: row["fullName"], country_id: row["countryId"],
        best_championship_position: blank_to_nil(row["bestChampionshipPosition"]),
        best_starting_grid_position: blank_to_nil(row["bestStartingGridPosition"]),
        best_race_result: blank_to_nil(row["bestRaceResult"]),
        best_sprint_race_result: blank_to_nil(row["bestSprintRaceResult"]),
        total_championship_wins: row["totalChampionshipWins"].to_i,
        total_race_entries: row["totalRaceEntries"].to_i,
        total_race_starts: row["totalRaceStarts"].to_i,
        total_race_wins: row["totalRaceWins"].to_i,
        total_1_and_2_finishes: row["total1And2Finishes"].to_i,
        total_race_laps: row["totalRaceLaps"].to_i,
        total_podiums: row["totalPodiums"].to_i,
        total_podium_races: row["totalPodiumRaces"].to_i,
        total_points: row["totalPoints"].to_f,
        total_championship_points: row["totalChampionshipPoints"].to_f,
        total_pole_positions: row["totalPolePositions"].to_i,
        total_fastest_laps: row["totalFastestLaps"].to_i,
        total_sprint_race_starts: row["totalSprintRaceStarts"].to_i,
        total_sprint_race_wins: row["totalSprintRaceWins"].to_i
      )
    end

    puts "Importing engine_manufacturers..."
    load_csv("f1db-engine-manufacturers.csv").each do |row|
      EngineManufacturer.find_or_initialize_by(id: row["id"]).update!(
        name: row["name"], country_id: row["countryId"],
        best_championship_position: blank_to_nil(row["bestChampionshipPosition"]),
        best_starting_grid_position: blank_to_nil(row["bestStartingGridPosition"]),
        best_race_result: blank_to_nil(row["bestRaceResult"]),
        best_sprint_race_result: blank_to_nil(row["bestSprintRaceResult"]),
        total_championship_wins: row["totalChampionshipWins"].to_i,
        total_race_entries: row["totalRaceEntries"].to_i,
        total_race_starts: row["totalRaceStarts"].to_i,
        total_race_wins: row["totalRaceWins"].to_i,
        total_race_laps: row["totalRaceLaps"].to_i,
        total_podiums: row["totalPodiums"].to_i,
        total_podium_races: row["totalPodiumRaces"].to_i,
        total_points: row["totalPoints"].to_f,
        total_championship_points: row["totalChampionshipPoints"].to_f,
        total_pole_positions: row["totalPolePositions"].to_i,
        total_fastest_laps: row["totalFastestLaps"].to_i,
        total_sprint_race_starts: row["totalSprintRaceStarts"].to_i,
        total_sprint_race_wins: row["totalSprintRaceWins"].to_i
      )
    end

    puts "Importing tyre_manufacturers..."
    load_csv("f1db-tyre-manufacturers.csv").each do |row|
      TyreManufacturer.find_or_initialize_by(id: row["id"]).update!(
        name: row["name"], country_id: row["countryId"],
        best_starting_grid_position: blank_to_nil(row["bestStartingGridPosition"]),
        best_race_result: blank_to_nil(row["bestRaceResult"]),
        best_sprint_race_result: blank_to_nil(row["bestSprintRaceResult"]),
        total_race_entries: row["totalRaceEntries"].to_i,
        total_race_starts: row["totalRaceStarts"].to_i,
        total_race_wins: row["totalRaceWins"].to_i,
        total_race_laps: row["totalRaceLaps"].to_i,
        total_podiums: row["totalPodiums"].to_i,
        total_podium_races: row["totalPodiumRaces"].to_i,
        total_pole_positions: row["totalPolePositions"].to_i,
        total_fastest_laps: row["totalFastestLaps"].to_i,
        total_sprint_race_starts: row["totalSprintRaceStarts"].to_i,
        total_sprint_race_wins: row["totalSprintRaceWins"].to_i
      )
    end

    puts "Importing seasons..."
    load_csv("f1db-seasons.csv").each do |row|
      Season.find_or_initialize_by(year: row["year"]).save!
    end

    puts "Importing races..."
    load_csv("f1db-races.csv").each do |row|
      Race.find_or_initialize_by(id: row["id"]).update!(
        year: row["year"], round: row["round"], date: row["date"],
        time: blank_to_nil(row["time"]), grand_prix_id: row["grandPrixId"],
        official_name: row["officialName"], qualifying_format: blank_to_nil(row["qualifyingFormat"]),
        sprint_qualifying_format: blank_to_nil(row["sprintQualifyingFormat"]),
        circuit_id: row["circuitId"], circuit_layout_id: blank_to_nil(row["circuitLayoutId"]),
        circuit_type: blank_to_nil(row["circuitType"]), direction: blank_to_nil(row["direction"]),
        course_length: blank_to_nil(row["courseLength"]), turns: blank_to_nil(row["turns"]),
        laps: blank_to_nil(row["laps"]), distance: blank_to_nil(row["distance"]),
        drivers_championship_decider: to_bool(row["driversChampionshipDecider"]),
        constructors_championship_decider: to_bool(row["constructorsChampionshipDecider"])
      )
    end

    # ---------- DAY 2: results & standings tables ----------

    puts "Importing race_results..."
    RaceResult.delete_all
    load_csv("f1db-races-race-results.csv").each do |row|
      RaceResult.create!(
        race_id: row["raceId"], driver_id: row["driverId"], constructor_id: row["constructorId"],
        engine_manufacturer_id: blank_to_nil(row["engineManufacturerId"]),
        tyre_manufacturer_id: blank_to_nil(row["tyreManufacturerId"]),
        position_display_order: row["positionDisplayOrder"], position_number: blank_to_nil(row["positionNumber"]),
        position_text: row["positionText"], driver_number: blank_to_nil(row["driverNumber"]),
        grid_position_number: blank_to_nil(row["gridPositionNumber"]), laps: blank_to_nil(row["laps"]),
        time: blank_to_nil(row["time"]), time_millis: blank_to_nil(row["timeMillis"]),
        gap: blank_to_nil(row["gap"]), interval: blank_to_nil(row["interval"]),
        points: row["points"].to_f, reason_retired: blank_to_nil(row["reasonRetired"])
      )
    end

    puts "Importing qualifying_results..."
    QualifyingResult.delete_all
    load_csv("f1db-races-qualifying-results.csv").each do |row|
      QualifyingResult.create!(
        race_id: row["raceId"], driver_id: row["driverId"], constructor_id: row["constructorId"],
        position_display_order: row["positionDisplayOrder"], position_number: blank_to_nil(row["positionNumber"]),
        position_text: row["positionText"], q1: blank_to_nil(row["q1"]), q2: blank_to_nil(row["q2"]),
        q3: blank_to_nil(row["q3"]), gap: blank_to_nil(row["gap"])
      )
    end

    puts "Importing starting_grid_positions..."
    StartingGridPosition.delete_all
    load_csv("f1db-races-starting-grid-positions.csv").each do |row|
      StartingGridPosition.create!(
        race_id: row["raceId"], driver_id: row["driverId"], constructor_id: row["constructorId"],
        engine_manufacturer_id: blank_to_nil(row["engineManufacturerId"]),
        tyre_manufacturer_id: blank_to_nil(row["tyreManufacturerId"]),
        driver_number: blank_to_nil(row["driverNumber"]),
        position_display_order: row["positionDisplayOrder"], position_number: blank_to_nil(row["positionNumber"]),
        position_text: row["positionText"],
        qualification_position_number: blank_to_nil(row["qualificationPositionNumber"]),
        qualification_position_text: blank_to_nil(row["qualificationPositionText"]),
        grid_penalty: blank_to_nil(row["gridPenalty"]),
        grid_penalty_positions: blank_to_nil(row["gridPenaltyPositions"]),
        time: blank_to_nil(row["time"]), time_millis: blank_to_nil(row["timeMillis"])
      )
    end

    puts "Importing fastest_laps..."
    FastestLap.delete_all
    load_csv("f1db-races-fastest-laps.csv").each do |row|
      FastestLap.create!(
        race_id: row["raceId"], driver_id: row["driverId"], constructor_id: row["constructorId"],
        position_number: blank_to_nil(row["positionNumber"]), lap: blank_to_nil(row["lap"]),
        time: blank_to_nil(row["time"]), time_millis: blank_to_nil(row["timeMillis"])
      )
    end

    puts "Importing pit_stops..."
    PitStop.delete_all
    load_csv("f1db-races-pit-stops.csv").each do |row|
      PitStop.create!(
        race_id: row["raceId"], driver_id: row["driverId"], constructor_id: row["constructorId"],
        stop_number: blank_to_nil(row["stop"]), lap: blank_to_nil(row["lap"]),
        time: blank_to_nil(row["time"]), time_millis: blank_to_nil(row["timeMillis"])
      )
    end

    puts "Importing race_driver_standings..."
    RaceDriverStanding.delete_all
    load_csv("f1db-races-driver-standings.csv").each do |row|
      RaceDriverStanding.create!(
        race_id: row["raceId"], driver_id: row["driverId"],
        position_display_order: row["positionDisplayOrder"], position_number: blank_to_nil(row["positionNumber"]),
        position_text: row["positionText"], points: row["points"].to_f,
        positions_gained: blank_to_nil(row["positionsGained"]), championship_won: to_bool(row["championshipWon"])
      )
    end

    puts "Importing race_constructor_standings..."
    RaceConstructorStanding.delete_all
    load_csv("f1db-races-constructor-standings.csv").each do |row|
      RaceConstructorStanding.create!(
        race_id: row["raceId"], constructor_id: row["constructorId"],
        position_display_order: row["positionDisplayOrder"], position_number: blank_to_nil(row["positionNumber"]),
        position_text: row["positionText"], points: row["points"].to_f,
        positions_gained: blank_to_nil(row["positionsGained"]), championship_won: to_bool(row["championshipWon"])
      )
    end

    puts "Importing season_driver_standings..."
    SeasonDriverStanding.delete_all
    load_csv("f1db-seasons-driver-standings.csv").each do |row|
      SeasonDriverStanding.create!(
        year: row["year"], driver_id: row["driverId"],
        position_display_order: row["positionDisplayOrder"], position_number: blank_to_nil(row["positionNumber"]),
        position_text: row["positionText"], points: row["points"].to_f
      )
    end

    puts "Importing season_constructor_standings..."
    SeasonConstructorStanding.delete_all
    load_csv("f1db-seasons-constructor-standings.csv").each do |row|
      SeasonConstructorStanding.create!(
        year: row["year"], constructor_id: row["constructorId"],
        position_display_order: row["positionDisplayOrder"], position_number: blank_to_nil(row["positionNumber"]),
        position_text: row["positionText"], points: row["points"].to_f
      )
    end

    puts "Importing season_drivers..."
    SeasonDriver.delete_all
    load_csv("f1db-seasons-drivers.csv").each do |row|
      SeasonDriver.create!(
        year: row["year"], driver_id: row["driverId"],
        total_race_entries: row["totalRaceEntries"].to_i, total_race_starts: row["totalRaceStarts"].to_i,
        total_race_wins: row["totalRaceWins"].to_i, total_race_laps: row["totalRaceLaps"].to_i,
        total_podiums: row["totalPodiums"].to_i, total_points: row["totalPoints"].to_f,
        total_pole_positions: row["totalPolePositions"].to_i, total_fastest_laps: row["totalFastestLaps"].to_i,
        total_driver_of_the_day: row["totalDriverOfTheDay"].to_i,
        best_race_result: blank_to_nil(row["bestRaceResult"]),
        best_starting_grid_position: blank_to_nil(row["bestStartingGridPosition"])
      )
    end

    puts "Importing season_constructors..."
    SeasonConstructor.delete_all
    load_csv("f1db-seasons-constructors.csv").each do |row|
      SeasonConstructor.create!(
        year: row["year"], constructor_id: row["constructorId"],
        total_race_entries: row["totalRaceEntries"].to_i, total_race_starts: row["totalRaceStarts"].to_i,
        total_race_wins: row["totalRaceWins"].to_i, total_race_laps: row["totalRaceLaps"].to_i,
        total_podiums: row["totalPodiums"].to_i, total_points: row["totalPoints"].to_f,
        total_pole_positions: row["totalPolePositions"].to_i, total_fastest_laps: row["totalFastestLaps"].to_i,
        best_race_result: blank_to_nil(row["bestRaceResult"]),
        best_starting_grid_position: blank_to_nil(row["bestStartingGridPosition"])
      )
    end

    puts "Done! Row counts:"
    [Continent, Country, Circuit, GrandPrix, Driver, Constructor, EngineManufacturer,
     TyreManufacturer, Season, Race, RaceResult, QualifyingResult, StartingGridPosition,
     FastestLap, PitStop, RaceDriverStanding, RaceConstructorStanding, SeasonDriverStanding,
     SeasonConstructorStanding, SeasonDriver, SeasonConstructor].each do |model|
      puts "  #{model.name}: #{model.count}"
    end
  end
end