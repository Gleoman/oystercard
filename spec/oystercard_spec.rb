require './lib/oystercard.rb'

RSpec.describe Oystercard do
  context '# .balance' do
    it "Should return balance as zero" do
      expect(subject.balance).to eq 0
    end
  end

  context '# .top_up' do
    it 'Should credit the top up amount to the balance' do
      money = 10
      new_balance = subject.balance + money
      expect(subject.top_up(money)).to eq new_balance
    end
  end

end
