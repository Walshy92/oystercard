class Oystercard
attr_reader :balance

MAX_BALANCE = 90

  def initialize
    @balance = 0
    @state = false
  end

  def top_up(n)
    raise "No, spend some first." if balance + n > MAX_BALANCE
    @balance += n
  end

  def deduct(n)
    raise "No monies." if balance - n <= 0
    @balance -= n
  end

  def touch_in
    @state = true
  end

  def in_journey?
    @state
  end

  def touch_out
    @state = false
  end
end
