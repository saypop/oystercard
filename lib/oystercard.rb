class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys
  attr_accessor :in_journey


  REQUIRED_BALANCE = 1
  MIN_CHARGE = 2

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise max_reached_message if max_reached(amount)
    @balance += amount
  end

  def in_journey?
    @entry_station
  end

  def touch_in(station)
    raise min_balance_message if @balance < REQUIRED_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    store_journey
    deduct(MIN_CHARGE)
    @entry_station, @exit_station = nil, nil
  end

  private
  def max_reached_message
    "Unsuccessful. You have the maximum allowed amount on your card."
  end

  def max_reached(amount)
    (@balance + amount) > 90
  end

  def min_balance_message
    "Sorry, your balance is too low to start this journey."
  end

  def deduct(amount)
    @balance -= amount
  end

  def store_journey
    @journeys << {:entry_station => @entry_station, :exit_station => @exit_station }
  end

end
