require 'station'

describe Station do

  let(:name_double) {double(:name)}
  let(:zone_double) {double(:zone)}
  subject {described_class.new(name_double, zone_double)}

  it "has a name" do
    expect(subject.name).to eq name_double
  end

  it "has a zone" do
    expect(subject.zone).to eq zone_double
  end

end
