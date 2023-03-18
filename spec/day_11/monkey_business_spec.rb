require_relative '../../day_11/monkey_business'

describe MonkeyBusiness do
  it 'reads text into monkeys' do
    business = nil
    file = File.open(__dir__ + '/small_sample.txt')
    business = MonkeyBusiness.new(file)

    expect(business.monkeys.count).to eq(3)
  end
end