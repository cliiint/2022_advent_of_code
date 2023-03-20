require_relative 'monkey_business'

module Solution
  def part_1
    file = File.open(__dir__ + '/data.txt')
    business = MonkeyBusiness.new(file, 20)
    business.start
    sorted = business.monkeys.sort_by(&:inspections)
    top_two = sorted[-2..-1]
    top_two[0].inspections * top_two[1].inspections
  end

  module_function :part_1
end

pp Solution.part_1