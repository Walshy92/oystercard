class Oystercard
attr_reader :balance

MAX_BALANCE = 90
MIN_BALANCE = 1

  def initialize
    @balance = 0
    @state = false
  end

  def top_up(n)
    raise "No, spend some first." if balance + n > MAX_BALANCE
    @balance += n
  end

  def deduct(n)
    @balance -= n
  end

  def touch_in
    raise "No funds." if balance < MIN_BALANCE
    @state = true
  end

  def in_journey?
    @state
  end

  def touch_out
    @state = false
    deduct(1)
  end

  private

  def deduct(n)
    @balance -= n
  end
end
