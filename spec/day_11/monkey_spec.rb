require_relative '../../day_11/monkey'

describe Monkey do
  before(:all) do
    input_a = [
      "Monkey 0:",
      "Starting items: 64",
      "Operation: new = old * 7",
      "Test: divisible by 13",
      "If true: throw to monkey 1",
      "If false: throw to monkey 1"
    ]
    input_b = [
      "Monkey 1:",
      "Starting items: 60, 84, 84, 65",
      "Operation: new = old + 7",
      "Test: divisible by 19",
      "If true: throw to monkey 0",
      "If false: throw to monkey 0"
    ]
    @monkey_a = Monkey.new(input_a)
    @monkey_b = Monkey.new(input_b)
    @monkey_a.take_turn([@monkey_a, @monkey_b])
  end

  it 'can throw to other monkeys' do
    expect(@monkey_a.items.empty?).to be_truthy
    expect(@monkey_b.items.count).to eq(5)
  end

  it 'caught items are added to the end' do
    expect(@monkey_b.items.last).to eq(149)
  end

  it 'increments inspections when inspecting' do
    expect(@monkey_a.inspections).to eq(1)
  end

  it 'inspects and calculates worry' do
    expect(@monkey_b.items).to eq([60, 84, 84, 65, 149])
  end
end