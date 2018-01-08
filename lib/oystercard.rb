class Oystercard
attr_reader :balance
attr_reader :status

TOP_UP_LIMIT = 90

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
    @status = true
  end

  def touch_out
    @status = false
  end

  def in_journey?
    @status
  end


end
