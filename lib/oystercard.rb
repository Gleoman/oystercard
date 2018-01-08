class Oystercard
  attr_reader :balance
  attr_reader :status

  TOP_UP_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(money)
    test_balance = balance + money
    raise "Maximum top-up of #{TOP_UP_LIMIT} amount exceeded" if test_balance > TOP_UP_LIMIT
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    raise "Minimum balance for a journey is £#{MINIMUM_BALANCE}" if balance < MINIMUM_BALANCE
    @status = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @status = false
  end

  def in_journey?
    @status
  end

  def deduct(charge)
    @balance -= charge
  end

end
