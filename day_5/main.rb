class Solution
  def initialize
    build_stacks
  end

  def part_1
  end

  def part_2
  end

  private

    def build_stacks
      9.times do|i|
        instance_variable_set("@s_#{i + 1}".to_sym, [])
      end

      lines = File.readlines(__dir__ + '/stacks.txt', chomp: true)
      stripped_lines = []

      lines.each do |l|
        i = 1
        stack = []
        while i < l.length
          stack << l[i]
          i += 4
        end
        stripped_lines << stack.join('')
      end

      stripped_lines.each do |s|
        s.each_char.with_index do |c, i|
          arr = instance_variable_get("@s_#{i + 1}")
          arr.unshift(c)
        end
      end
    end
end

solution = Solution.new