require 'journey'

describe Journey do

  let(:card_double) {double(:card)}
  let(:entry_station_double) {double(:station)}
  let(:exit_station_double) {double(:station)}
  let(:journey_log_double) {double(:journey_log)}
  let(:subject) {Journey.new(journey_log_double, card_double)}

  it 'is linked to a card' do
    expect(subject.card).to eq card_double
  end

  it 'stores an entry station' do
    expect{subject.enter(entry_station_double)}.to change{subject.entry_station}.from(nil).to(entry_station_double)
  end

  it 'can tell if there is a live journey' do
    expect(subject).not_to be_in_journey
  end

  it 'stores an exit station' do
    expect{subject.exit(exit_station_double)}.to change{subject.exit_station}.from(nil).to(exit_station_double)
  end


  it 'calculates a normal fare if journey is complete' do
    allow(subject).to receive(:complete?).and_return(true)
    expect(subject.calculate_fare).to eq 2
  end

  it 'calculates a penalty fare if journey is incomplete' do
    expect(subject.calculate_fare).to eq 6
  end

end
