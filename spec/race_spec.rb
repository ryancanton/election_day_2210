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

end
