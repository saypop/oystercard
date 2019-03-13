require 'Oystercard'
describe Oystercard do

  let(:entry_station_double) { double(:station) }
  let(:exit_station_double) { double(:station) }
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

  it 'changes journey status with a touch_out' do
    allow subject.in_journey = true
    subject.touch_out(exit_station_double)
    expect(subject).not_to be_in_journey
  end

  it 'raises an error when we touch_in with less than £1' do
    expect {subject.touch_in(entry_station_double)}.to raise_error{
      "Sorry, your balance is too low to start this journey."
    }
  end

  it 'charges you an amount when you touch out' do
    subject.top_up(10)
    expect { subject.touch_out(exit_station_double) }.to change{subject.balance}.by(-2)
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  it 'touching in and out creates one journey' do
    subject.top_up(90)
    subject.touch_in(entry_station_double)
    subject.touch_out(exit_station_double)
    expect(subject.journeys).to eq [{:entry_station => entry_station_double, :exit_station => exit_station_double}]
  end

end
