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

  context '# .deduct' do
    it "Should deduct the fare from the balance" do
      subject.top_up(20)
      expect(subject.deduct(10)).to eq 10
    end
  end

  context '# .in_journey?' do
    it "Should give an status of Oystercard as not in journey" do
      expect(subject).not_to be_in_journey
    end
  end

  context '# touch_in' do
    it "Should change user status to in journey true" do
      expect(subject.touch_in).to eq true
    end
  end

  context '# touch_out' do
    it "Should change user status to false" do
      expect(subject.touch_out).to eq false
    end
  end

end
