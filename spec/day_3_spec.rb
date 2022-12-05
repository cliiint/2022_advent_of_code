require_relative '../day_3/main'

describe RuckSack do
  rucksack = RuckSack.new('gnJudgwy')

  it 'should have expected read properties' do
    expect(rucksack.instance_variable_defined?(:@compartment_1)).to eq(true)
  end

  it 'should have equally filled compartments' do
    expect(rucksack.compartment_1.length).to eq(rucksack.compartment_2.length)
  end

  it 'should have the expected shared item' do
    expect(rucksack.find_shared_item).to eq('g')
  end
end