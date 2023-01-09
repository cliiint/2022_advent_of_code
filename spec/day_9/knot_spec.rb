require_relative '../../day_9/knot'

describe Knot do
  let(:knot) { described_class.new }

  it 'initializes at 0,0' do
    expect(knot.current_position[:x]).to be_zero
    expect(knot.current_position[:y]).to be_zero
  end

  it 'collects points' do
    knot.add_point(1, 1)
    expect(knot.points.count).to eq(2)
  end

  it 'returns coords as hash with x and y keys using class method' do
    hash = described_class.to_coords('2,3')

    expect(hash.class).to eq(Hash)
    expect(hash.has_key?(:x)).to be_truthy
    expect(hash.has_key?(:y)).to be_truthy
  end
end