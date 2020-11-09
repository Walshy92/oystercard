class Journey

attr_reader :entry, :exit

MIN_FARE = 1
PEN_FARE = 6

  def initialize(entry)
    @entry = entry
    @exit = nil
  end

  def end(exit)
    @exit = exit
  end

  def fare
    return PEN_FARE unless @entry && @exit
    return MIN_FARE
  end
end
