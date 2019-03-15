require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :journey

  REQUIRED_BALANCE = 1 unless const_defined?(:REQUIRED_BALANCE)
  MAXIMUM_BALANCE = 90 unless const_defined?(:MAX_BALANCE)

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise max_reached_message if max_reached(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station, journey_class = Journey)
    raise min_balance_message if @balance < REQUIRED_BALANCE
    start_trip(station, journey_class)
  end

  def touch_out(station, journey_class = Journey)
    end_trip(station, journey_class)
    @journey = nil
  end

  def update(journey)
    @journeys << journey
  end

  private

  def in_journey?
    @journey.in_journey?
  end

  def max_reached_message
    "Unsuccessful. You cannot have more than £#{MAXIMUM_BALANCE} on your card."
  end

  def max_reached(amount)
    (@balance + amount) > MAXIMUM_BALANCE
  end

  def min_balance_message
    "Sorry, your balance is too low to start this journey."
  end

  def start_trip(station, journey_class)
    @journey = journey_class.new(self) if @journey.nil?
    @journey.start(station)
  end

  def end_trip(station, journey_class)
    @journey = journey_class.new(self) if @journey.nil?
    @journey.finish(station)
  end

end
