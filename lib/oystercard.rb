class Oystercard
attr_reader :balance

MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(n)
    raise "No, spend some first." if balance + n > MAX_BALANCE
    @balance += n
  end
end
