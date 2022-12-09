class Solution
  def part_1(input)
    result = nil
    i = 0
    stack = []

    while i < input.length && result.nil?
      stack << input[i]
      if i > 2
        result = i + 1 unless Solution.duplicates?(stack)
        stack.shift
      end
      i += 1
    end

    result
  end

  def part_2(input)
    result = nil
    i = 0
    stack = []

    while i < input.length && result.nil?
      stack << input[i]
      if i > 12
        result = i + 1 unless Solution.duplicates?(stack)
        stack.shift
      end
      i += 1
    end

    result
  end

  def self.duplicates?(arr)
    i = 0
    while i < arr.length
      j = i + 1
      while j < arr.length
        return true if arr[i] == arr[j]
        j += 1
      end
      i += 1
    end

    false
  end
end

solution = Solution.new
# p solution.part_1(File.readlines(__dir__ + '/data.txt', chomp: true)[0])
# 1625
p solution.part_2(File.readlines(__dir__ + '/data.txt', chomp: true)[0])
# 2250