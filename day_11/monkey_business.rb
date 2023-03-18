class MonkeyBusiness
  attr_accessor :monkeys
  def initialize(file)
    @monkeys = []
    make_monkeys(file)
  end

  def make_monkeys(file)
    lines = file.readlines
    monkey_raw = []
    single = []
    i = 0
    while i < lines.length
      cur_line = lines[i]
      single.push(cur_line.strip)
      if (i + 1) % 7 == 0 || i + 1 == lines.count
        monkey_raw.push(single)
        single = []
      end
      i += 1
    end

    @monkeys = monkey_raw.map { |r| Monkey.new(r) }
    pp @monkeys
  end
end