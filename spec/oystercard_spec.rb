require 'Oystercard'
describe Oystercard do

  let(:entry_station_double) { double(:station) }
  let(:exit_station_double) { double(:station) }
  let(:journey_class_double) {double(:journey_class)}
  let(:journey_double) {double(:journey)}
  let(:journey_log_class_double) {double(:journey_log)}
  let(:journey_log_double) {double(:journey_log)}
  let(:subject) {Oystercard.new(journey_log_class_double, journey_log_double)}


  describe '#top_up' do

    it 'is able to top-up' do
      expect{subject.top_up(5)}.to change{subject.balance}.by(5)
    end

    it 'raises error when topping up to more than max balance' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect{subject.top_up(1)}.to raise_error(
        "Unsuccessful. You cannot have more than £#{Oystercard::MAXIMUM_BALANCE} on your card."
      )
    end

  end

  describe '#deduct' do

    it 'deducts an amount from balance' do
      expect{subject.deduct(5)}.to change{subject.balance}.by (-5)
    end

  end

  describe '#touch_in' do

    it 'raises an error when we touch_in with less than £1' do
      expect{subject.touch_in(entry_station_double)}.to raise_error{
        "Sorry, your balance is too low to start this journey."
      }
    end

    it 'creates a starts a new journey' do
      subject.top_up(20)
      expect(journey_log_double).to receive(:start)
      subject.touch_in(entry_station_double, journey_class_double)
    end

    it 'starts a journey' do
      subject.top_up(20)
      expect(journey_log_double).to receive(:start).with(entry_station_double, journey_class_double)
      subject.touch_in(entry_station_double, journey_class_double)
    end

  end

  describe '#touch_out' do

    it 'sets journey to nil' do
      allow(journey_log_double).to receive(:finish).with(exit_station_double, journey_class_double)
      expect(subject.touch_out(exit_station_double, journey_class_double)).to eq nil
    end

    it 'finishes a new journey' do
      subject.top_up(20)
      expect(journey_log_double).to receive(:finish).with(exit_station_double, journey_class_double)
      subject.touch_out(exit_station_double, journey_class_double)
    end

  end

  describe '#update' do

    it 'updates a journey' do
      expect(journey_log_double).to receive(:update)
      subject.update
    end

  end

end
