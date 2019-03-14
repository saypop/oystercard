require_relative 'oystercard'

class Journey

  attr_reader :entry_station, :exit_station, :current, :fare, :card

  MIN_CHARGE = 2
  PENALTY_FARE = 6

  def initialize(card)
    @card = card
  end

  def start(station)
    process_journey if in_journey?
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    process_journey
  end

  def in_journey?
    !@entry_station.nil?
  end

  def calculate_fare
    @fare = PENALTY_FARE
    @fare = MIN_CHARGE if complete?
    @fare
  end

  private

  def process_journey
    calculate_fare
    store
    @card.deduct(@fare)
  end

  def store
    @card.update(current)
  end

  def current
    {:entry_station => @entry_station, :exit_station => @exit_station, :fare => @fare }
  end

  def complete?
    !@entry_station.nil? && !@exit_station.nil?
  end

end
