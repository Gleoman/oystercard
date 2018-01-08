require './lib/oystercard.rb'

RSpec.describe Oystercard do

  let(:station) {double :station}

  context '#balance' do
    it "Should return balance as zero" do
      expect(subject.balance).to eq 0
    end
  end

  context '#top_up' do
    it 'Should credit the top up amount to the balance' do
      money = 10
      new_balance = subject.balance + money
      expect(subject.top_up(money)).to eq new_balance
    end

    it "Should raise an error if top-up takes balance above 90" do
      expect { subject.top_up(100) }.to raise_error "Maximum top-up of #{Oystercard::TOP_UP_LIMIT} amount exceeded"
    end
  end

  context '#deduct' do
    it "Should deduct the fare from the balance" do
      subject.top_up(20)
      expect(subject.deduct(10)).to eq 10
    end
  end

  context '#in_journey?' do
    it "Should give an status of Oystercard as not in journey" do
      expect(subject).not_to be_in_journey
    end
  end

  context '#touch_in' do
    it "Should change user status to in journey true" do
      subject.top_up(10)
      expect(subject.touch_in).to eq true
    end

    it "Should raise an error if minimum balance is less than £1" do
      expect { subject.touch_in }.to raise_error "Minimum balance for a journey is £#{Oystercard::MINIMUM_BALANCE}"
    end

    it "Should remember the station touched into" do
      allow(station).to recieve(:station)
    end


  end

  context '#touch_out' do
    it "Should change user status to not in journey false" do
      expect(subject.touch_out).to eq false
    end

    it "Should charge the Oystercard £1 on touch out" do
      subject.top_up(10)
      expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
    end
  end

end
