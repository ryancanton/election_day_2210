class Election

  attr_reader :year,
              :races

  def initialize(year)
    @year = year.to_s
    @races = []
  end
end
