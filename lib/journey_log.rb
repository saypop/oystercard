require_relative 'journey'

class JourneyLog

  attr_reader :dup_journeys

  def initialize(journey_class = Journey, card)
    @journey_class = journey_class
    @journey_log = []
    @card = card
  end

  def start(station, journey_class)
    @journey = journey_class.new(self, @card) if @journey.nil?
    @journey.process_journey if @journey.in_journey?
    @journey.enter(station)
  end

  def finish(station, journey_class)
    @journey = journey_class.new(self, @card) if @journey.nil?
    @journey.exit(station)
    @journey.process_journey
  end

  def journeys
    @dup_journey_log = @journey_log.dup
  end

  def update
    @journey_log << current_journey
  end

  private

  def current_journey
    {:entry_station => @journey.entry_station, :exit_station => @journey.exit_station, :fare => @journey.fare }
  end

end
