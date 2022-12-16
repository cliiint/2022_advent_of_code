class TreeFile
  attr_accessor :name, :size

  def initialize(name, size)
    @name = name
    @size = size
  end
end

class TreeDir
  attr_accessor :name, :parent, :contents

  def initialize(name, parent = nil)
    @name = name
    @parent = parent
    @contents = []
  end
end

class Tree
  attr_accessor :root, :pointer

  def initialize(file)
    @root = builda(file)
    @pointer = nil
  end

  def parse_command(line)
    if line[0] == '$'
      line = line[1..]
      split = line.split(' ')

      if split[0] == 'cd'
        @tree.cd(split[1])
      end
    else
      if line[0..2] == 'dir'
        split = line[4..].split(' ')
        @tree.dir(split[0])
      else
        size, name = line.split
        file = TreeFile.new(name, size.to_i)
        @tree.pointer.contents << file
      end
    end
  end

  def cd(command)
    case
    when command == '/'
      @root = TreeDir.new('/')
      @pointer = @root
    when command == '..'
      @pointer = @pointer.parent
    else
      dir = @pointer.contents.select { |x| x.name == command }[0]
      @pointer = dir
    end
  end

  def dir(name)
    @pointer.contents << TreeDir.new(name, @pointer)
  end

  private

    def build(file)
      lines = file.readlines(__dir__ + '/data.txt', chomp: true)
      lines.each do |l|
        parse_co7u-mmand(l)
      end
    end
end

class Solution
  def initialize
    file = File.open(__dir__ + '/data.txt')
    @tree = Tree.new(file)
    file.close
  end

  def part_1
    traverse(@tree.root)
  end

  def part_2

  end

  def traverse(dir)
    sum = 0
    files = []
    dirs = []

    dir.contents.each do |c|
      files << c if c.class == TreeFile
      dirs << c if c.class == TreeDir
    end

    dirs.each { |d| traverse(d) }
    sum += files.map { |f| f.size }.sum
  end
end

solution = Solution.new

solution.part_1
# too low: 290229
# too high: 1701532



# breadth first.... no good i think
# def part_1
#   sum = 0
#   stack = [@tree.root]
#   while stack.length > 0
#     dir_size = 0
#     files = []
#     current = stack.pop
#     current.contents.each do |i|
#       if i.class == TreeDir
#         stack << i
#       else
#         files << i
#       end
#     end
#
#     dir_size = files.map { |f| f.size }.sum
#     sum += dir_size if dir_size <= 100000
#   end
#
#   p sum
# end