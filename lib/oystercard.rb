class Oystercard
  attr_reader :balance
  attr_reader :status
  attr_reader :entry_station

  TOP_UP_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
  end

  def top_up(money)
    test_balance = balance + money
    raise "Maximum top-up of #{TOP_UP_LIMIT} amount exceeded" if test_balance > TOP_UP_LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in(station)
    raise "Minimum balance for a journey is £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  def deduct(charge)
    @balance -= charge
  end


end
