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

  def candidates
    candidates = @races.map do |race|
      race.candidates
    end.flatten
  end

  def vote_counts
    vote_counts = {}
    candidates.each do |candidate|
      vote_counts[candidate.name] = candidate.votes
    end
    vote_counts
  end

  def winners
    winners = []
    @races.each do |race|
      if race.winner
        winners.push(race.winner)
      end
    end
    winners
  end
end
