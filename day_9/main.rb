require_relative 'knot'
require_relative 'plot_system'

class Solution
  def part_1
    head = Knot.new
    tail = Knot.new
    plot = PlotSystem.new(head, tail)
    plot.simulate

    tail.unique_positions
  end
end

solution = Solution.new

pp solution.part_1
