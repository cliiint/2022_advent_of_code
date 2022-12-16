require_relative './tree'
require_relative './tree_grid'

class Solution
  def part_1
    file = File.open(__dir__ + '/data.txt')
    grid = TreeGrid.new(file)
    file.close

    grid.visible_count
  end
end

solution = Solution.new
p solution.part_1