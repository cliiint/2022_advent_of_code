require_relative '../../day_12/vertex'

describe Vertex do
  let(:start) { described_class.new(0, 1, 'S') }
  let(:finish) { described_class.new(0, 1, 'E') }
  let(:normal) { described_class.new(2, 5, 'f') }

  it 'sets start attribute correctly' do
    expect(normal.is_start).to be_falsey
    expect(start.is_start).to be_truthy
  end

  it 'sets finish attribute correctly' do
    expect(normal.is_finish).to be_falsey
    expect(finish.is_finish).to be_truthy
  end
end