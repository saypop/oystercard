require_relative 'oystercard'

class Journey

  attr_reader :entry_station, :exit_station, :current, :fare, :card, :journey_log

  MIN_CHARGE = 2
  PENALTY_FARE = 6

  def initialize(journey_log = card.journey_log, card)
    @card = card
    @journey_log = journey_log
  end

  def enter(station)
    @entry_station = station
  end

  def exit(station)
    @exit_station = station
  end

  def in_journey?
    !@entry_station.nil?
  end

  def calculate_fare
    @fare = PENALTY_FARE
    @fare = MIN_CHARGE if complete?
    @fare
  end

  def process_journey
    calculate_fare
    store
    @card.deduct(@fare)
  end

  private

  def store
    @journey_log.update
  end

  def complete?
    !@entry_station.nil? && !@exit_station.nil?
  end

end
