class Solution
  def initialize
    build_stacks
  end

  def part_1
    lines = File.readlines(__dir__ + '/instructions.txt', chomp: true)
    lines.each do |l|
      move_crate(l)
    end

    str = ''
    stacks.each { |s| str += s[s.length - 1] }
    str
  end

  def part_2
    lines = File.readlines(__dir__ + '/instructions.txt', chomp: true)
    lines.each do |l|
      move_crates(l)
    end

    str = ''
    stacks.each { |s| str += s[s.length - 1] }
    str
  end

  def move_crate(instruct)
    split = instruct.split('from')
    qty = split[0][5..].to_i
    src, dest = split[1].split('to').map { |s| s.to_i }

    src_stack = instance_variable_get("@s_#{src}")
    dest_stack = instance_variable_get("@s_#{dest}")

    qty.times do
      dest_stack << src_stack.pop
    end
  end

  def move_crates(instruct)
    split = instruct.split('from')
    qty = split[0][5..].to_i
    src, dest = split[1].split('to').map { |s| s.to_i }

    src_stack = instance_variable_get("@s_#{src}")
    dest_stack = instance_variable_get("@s_#{dest}")

    moved = src_stack.slice!(-qty, qty)
    instance_variable_set("@s_#{dest}", dest_stack + moved) unless moved.nil?
  end

  def stacks
    stacks = []
    9.times do |i|
      stacks << instance_variable_get("@s_#{i + 1}".to_sym)
    end
    stacks
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
          arr.unshift(c) unless c == ' '
        end
      end
    end
end

solution = Solution.new
# p solution.part_1
# TDCHVHJTG
# p solution.part_2
# NGCMPJLHV