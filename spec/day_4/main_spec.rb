require_relative '../../day_4/main'

describe Solution do
  solution = Solution.new

  it 'should have part 1 and 2 methods' do
    expect(solution.respond_to?(:part_1)).to eq(true)
    expect(solution.respond_to?(:part_2)).to eq(true)
  end

  it 'create_ranges should return a tuple of ranges' do
    ranges = Solution.create_ranges('5-7,7-9')

    expect(ranges).to be_an_instance_of(Array)
    expect(ranges[0]).to be_an_instance_of(Range)
    expect(ranges[1]).to be_an_instance_of(Range)
  end
end