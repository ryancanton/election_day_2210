class Race

  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
    @tie = false
  end

  def register_candidate!(candidate_info)
    new_candidate = Candidate.new(candidate_info)
    @candidates.push(new_candidate)
    new_candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    if open?
      return false
    else
      votes = @candidates.map { |candidate| candidate.votes}
      winners = find_candidates_by_vote_count(votes.max)
      if winners.count == 1
        return winners[0]
      else
        @tie = true
        return false
      end
    end
  end

  def find_candidates_by_vote_count(count)
    specified_candidates = @candidates.find_all { |candidate| candidate.votes == count}
  end

  def tie?
    winner
    @tie
  end
end
