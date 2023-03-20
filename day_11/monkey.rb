class Monkey
  attr_accessor :inspections, :items

  def initialize(input)
    parse_input(input)
    @inspections = 0
  end

  def add(item)
    @items.push(item)
  end

  def throw_item(monkey, item)
    monkey.add(item)
  end

  def take_turn(monkeys)
    while @items.count > 0
      monkey, item = inspect_item(monkeys)
      throw_item(monkey, item)
    end
  end

  def inspect_item(monkeys)
    @inspections += 1
    item = @items.shift
    item = @operation.call(item)
    item = (item / 3).floor
    test_res = @test.call(item)
    target_idx = test_res ? @true_target : @false_target
    [monkeys[target_idx], item]
  end

  private

  def parse_input(input)
    @items = input[1].split(':')[1].split(',').map { |s| s.to_i }
    @operation = parse_operation(input[2])
    @test = parse_test(input[3])
    @true_target = parse_action(input[4])
    @false_target = parse_action(input[5])
  end

  def parse_operation(str)
    operator, int_s = str.split('=')[1].split(' ')[1..2]
    Proc.new { |x| x.public_send(operator, int_s == 'old' ? x : int_s.to_i) }
  end

  def parse_test(str)
    int = str.split('by')[1].to_i
    Proc.new { |x| x % int == 0 }
  end

  def parse_action(str)
    str.split('monkey')[1].to_i
  end
end