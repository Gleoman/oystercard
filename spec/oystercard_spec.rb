require './lib/oystercard.rb'

RSpec.describe Oystercard do
  context '# .balance' do
    it "Should return balance as zero" do
      expect(subject.balance).to eq 0
    end
  end
end
