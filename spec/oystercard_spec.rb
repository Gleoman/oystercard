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

    it "Should raise an error if top-up takes balance above 90" do
      expect{subject.top_up(100)}.to raise_error "Maximum top-up of #{Oystercard::TOP_UP_LIMIT} amount exceeded"
    end
  end

end
