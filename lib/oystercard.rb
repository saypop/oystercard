require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :journey

  REQUIRED_BALANCE = 1 unless const_defined?(:REQUIRED_BALANCE)

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise max_reached_message if max_reached(amount)
    @balance += amount
  end

  def touch_in(station)
    raise min_balance_message if @balance < REQUIRED_BALANCE
    @journey = Journey.new(self) if @journey.nil?
    @journey.start(station)
  end

  def touch_out(station)
    @journey = Journey.new(self) if @journey.nil?
    @journey.finish(station)
    @journey = nil
  end

  def update(journey)
    @journeys << journey
    p @journeys
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def in_journey?
    @journey.in_journey?
  end

  def max_reached_message
    "Unsuccessful. You have the maximum allowed amount on your card."
  end

  def max_reached(amount)
    (@balance + amount) > 90
  end

  def min_balance_message
    "Sorry, your balance is too low to start this journey."
  end

end
