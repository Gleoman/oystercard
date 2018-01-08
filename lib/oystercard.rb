class Oystercard
attr_reader :balance

TOP_UP_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    test_balance = balance + money
    raise "Maximum top-up of #{TOP_UP_LIMIT} amount exceeded" if test_balance > TOP_UP_LIMIT
    @balance += money
  end

end
