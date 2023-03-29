require_relative 'graph'

module Solution
  def part_1
    g = Graph.new
    lines = File.readlines(__dir__ + '/sample.txt', chomp: true).map { |l| l.chars }
    lines.each.with_index do |l, i| # i is x coord
      l.each.with_index do |c, j| # is y coord
        g.add_vertex([x, y])
      end
    end

    pp g

  end

  module_function :part_1
end

Solution::part_1