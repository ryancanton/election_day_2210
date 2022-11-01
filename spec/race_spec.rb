require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  describe '#initialize' do
    it 'exists' do
      race = Race.new("Texas Governor")

      expect(race).to be_a(Race)
    end

    it 'has attributes' do
      race = Race.new("Texas Governor")

      expect(race.office).to eq("Texas Governor")
      expect(race.candidates).to eq([])
    end
  end

  describe '#register_candidate!' do
    it 'adds candidate object to roster for race' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

      expect(race.candidates).to eq([candidate1, candidate2])
    end
  end

  describe '#open?' do
    it 'returns true by default' do
      race = Race.new("Texas Governor")

      expect(race.open?).to eq(true)
    end
  end

  describe '#close!' do
    it 'closes the race' do
      race = Race.new("Texas Governor")
      race.close!

      expect(race.open?).to eq(false)
    end
  end

  describe '#winner' do
    it 'returns false if the election is still open' do
      race = Race.new("Texas Governor")

      expect(race.winner).to eq(false)
    end

    it 'returns the candidate object with the most votes if election is closed' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      race.close!

      expect(race.winner).to eq(candidate1)
    end
  end

  describe '#find_candidates_by_vote_count' do
    it 'returns array of candidates with specific vote counts' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}

      expect(race.find_candidates_by_vote_count(4)).to eq([candidate1])
    end
  end

  describe '#tie?' do
    it 'returns true if the leading candidates have the same number of votes' do
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      4.times {candidate1.vote_for!}
      4.times {candidate2.vote_for!}
      race.close!

      expect(race.tie?).to eq(true)
    end
  end
end
