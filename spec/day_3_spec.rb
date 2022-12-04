require_relative '../day_3/main'

describe RuckSack do
  rucksack = RuckSack.new('gnJudqwy')

  it 'should have expected read properties' do
    expect(rucksack.instance_variable_defined?(:@compartment_1)).to eq(true)
  end

  it 'should have equally filled compartments' do
    expect(rucksack.compartment_1.length).to eq(rucksack.compartment_2.length)
  end

  it 'should have a shared item' do
    expect(rucksack.shared_item).to_not be_nil
  end
end