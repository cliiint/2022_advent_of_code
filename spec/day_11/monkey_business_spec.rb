require_relative '../../day_11/monkey_business'

describe MonkeyBusiness do
  it 'reads text into monkeys' do
    file = File.open(__dir__ + '/example_sample.txt')
    business = MonkeyBusiness.new(file, 1)
    business.start

    expect(business.monkeys.count).to eq(4)
  end
end