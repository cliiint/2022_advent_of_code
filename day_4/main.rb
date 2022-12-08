class Solution
  def initialize
    @range_pairs = init_ranges
  end

  def self.create_ranges(str)
    split = str.split(',')
    a = split[0].split('-')
    b = split[1].split('-')

    [a[0].to_i..a[1].to_i, b[0].to_i..b[1].to_i]
  end

  def self.contain?(range_1, range_2)
    (range_1.first >= range_2.first && range_1.last <= range_2.last) ||
      (range_2.first >= range_1.first && range_2.last <= range_1.last)
  end

  def self.overlap?(range_1, range_2)
    (range_1.include?(range_2.first) || range_1.include?(range_2.last)) ||
      (range_2.include?(range_1.first) || range_2.include?(range_1.last))
  end

  def part_1
    contained_assignments = 0
    @range_pairs.each { | r | contained_assignments += 1 if Solution.contain?(r[0], r[1] ) }
    contained_assignments
    # 599
  end

  def part_2
    contained_assignments = 0
    @range_pairs.each { | r | contained_assignments += 1 if Solution.overlap?(r[0], r[1] ) }
    contained_assignments
    # 928
  end

  private

    def init_ranges
      lines = File.readlines(__dir__ + '/data.txt', chomp: true)
      ranges = []
      lines.each { |l| ranges << Solution.create_ranges(l) }
      @range_pairs = ranges
    end
end

solution = Solution.new

# p solution.part_1
# p solution.part_2