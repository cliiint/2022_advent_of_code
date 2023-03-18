class Monkey
  def initialize(input)
    parse_input(input)
  end

  def add(item)
    @items.push(item)
  end

  def throw(monkey)
    item = @items.shift
    monkey.add(item)
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
    operator, int_s = str.split('old')[1].strip.split(' ')
    Proc.new { |x| x.public_send(operator, int_s.to_i) }
  end

  def parse_test(str)
    int = str.split('by')[1].to_i
    Proc.new { |x| x % int == 0 }
  end

  def parse_action(str)
    str.split('monkey')[1].to_i
  end
end