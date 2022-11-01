class Election

  attr_reader :year,
              :races

  def initialize(year)
    @year = year.to_s
    @races = []
  end

  def add_race(race)
    @races.push(race)
  end
end
