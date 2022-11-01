class Race

  attr_reader :office,
              :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
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
end
