require 'journey_log'

describe JourneyLog do

  let(:entry_station_double) { double(:station) }
  let(:exit_station_double) { double(:station) }
  let(:journey_class_double) {double(:journey_class)}
  let(:journey_double) {double(:journey)}
  let(:card_double) {double(:card)}
  let(:subject) {JourneyLog.new(journey_class_double, card_double)}

  describe '#start' do
    it 'start a new journey with an entry station' do
      allow(journey_class_double).to receive(:new).and_return(journey_double)
      allow(journey_double).to receive(:process_journey)
      allow(journey_double).to receive(:in_journey?).and_return(false)
      expect(journey_double).to receive(:enter).with(entry_station_double)
      subject.start(entry_station_double, journey_class_double)
    end
  end

  describe '#finish' do
    it 'adds exit station to current_journey' do
      allow(journey_class_double).to receive(:new).and_return(journey_double)
      allow(journey_double).to receive(:process_journey)
      allow(journey_double).to receive(:in_journey?).and_return(false)
      expect(journey_double).to receive(:exit).with(exit_station_double)
      subject.finish(exit_station_double, journey_class_double)
    end
  end

end
