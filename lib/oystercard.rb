class Oystercard
attr_reader :balance, :entry_station

MAX_BALANCE = 90
MIN_BALANCE = 1

  def initialize
    @entry_station = nil
    @balance = 0
    @state = false
  end

  def top_up(n)
    raise "No, spend some first." if balance + n > MAX_BALANCE
    @balance += n
  end

  def touch_in(entry_station)
    raise "No funds." if balance < MIN_BALANCE
    @state = true
    @entry_station = entry_station
  end

  def in_journey?
    if @entry_station != nil
      true
    else
      false
    end
  end

  def touch_out(exit_station)
    @state = false
    deduct(1)
    @entry_station = nil
    @exit_station = exit_station
  end

  private

  def deduct(n)
    @balance -= n
  end
end
