require_relative '../../day_11/monkey'

describe Monkey do
  let(:monkey_c) do
    monkey = described_class.new
    monkey.items = [100, 200, 300]
    monkey.operation = ['*', 2]
    monkey.test = {
      test => Proc.new { |x| x % 2 == 0},
      true => 2,
      false => 3
    }
    monkey
  end

  it 'can throw to other monkeys' do
    monkey_a = Monkey.new
    monkey_b = Monkey.new
    monkey_a.add(101)
    monkey_a.throw_to(monkey_b)

    expect(monkey_a.items.empty?).to be_truthy
    expect(monkey_b.items.include?(101)).to be_truthy
  end

  it 'throws items in the order they are listed' do
    monkey_a = Monkey.new
    monkey_b = Monkey.new
    monkey_a.add(200).add(201).throw_to(monkey_b)

    expect(monkey_a.items).to eq([201])
    expect(monkey_b.items).to eq([200])
  end

  it 'caught items are added to the end' do
    monkey_a = Monkey.new
    monkey_b = Monkey.new
    monkey_a.add(100)
    monkey_a.throw_to(monkey_b)
    monkey_b.add(200).add(201)

    expect(monkey_b.items.last).to eq(100)
  end

  it 'increments inspections when inspecting' do
    monkey = Monkey.new.add(100).add(300)
    monkey.inspect

    expect(monkey.inspections).to eq(2)
  end

  it 'inspects and calculates worry' do
    monkey_a = Monkey.new
    monkey_b = Monkey.new
    monkey_a.add(200)

    # operation
    # divide by three + round
    # test
    # throw based on test result
  end
end