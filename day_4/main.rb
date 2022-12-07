class Solution
  def self.create_ranges(str)
    split = str.split(',')
    a = split[0].split('-')
    b = split[1].split('-')

    [a[0].to_i..a[1].to_i, b[0].to_i..b[1].to_i]
  end

  def part_1
    contained_assignments = 0

    lines = File.readlines(__dir__ + '/data.txt', chomp: true)
    lines.each do |l|
      ranges = create_ranges(l)
      a, b = ranges[0], ranges[1]
      overlap =
        (a.first >= b.first && a.last <= b.last) ||
          (b.first >= a.first && b.last <= a.last)

      contained_assignments += 1 if overlap
      # 599
      contained_assignments
    end
  end

  def part_2

  end
end