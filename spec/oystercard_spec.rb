require 'Oystercard'
describe Oystercard do

  let(:entry_station_double) { double(:station) }
  let(:exit_station_double) { double(:station) }
  let(:journey_class_double) {double(:journey_class)}
  let(:journey_double) {double(:journey)}

  let(:subject) {Oystercard.new}

  describe '#top_up' do

    it 'is able to top-up' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end

    it 'raises error when topping up to more than 90' do
      subject.top_up(90)
      expect {subject.top_up(1)}.to raise_error(
        "Unsuccessful. You have the maximum allowed amount on your card."
      )
    end

  end

  it 'raises an error when we touch_in with less than £1' do
    expect {subject.touch_in(entry_station_double)}.to raise_error{
      "Sorry, your balance is too low to start this journey."
    }
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  it 'deducts an amount from balance' do
    subject.top_up(5)
    subject.deduct(5)
    expect(subject.balance).to eq 0
  end

  it 'updates a journey' do
    subject.update(journey_double)
    expect(subject.journeys).to eq [journey_double]
  end

end
