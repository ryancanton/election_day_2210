require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  describe '#initialize' do
    it 'exists' do
      election = Election.new('2022')

      expect(election).to be_a(Election)
    end

    it 'has correct attributes' do
      election = Election.new('2022')

      expect(election.year).to eq("2022")
      expect(election.races).to eq([])
    end
  end
end
