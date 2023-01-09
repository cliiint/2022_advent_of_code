class PlotSystem
  attr_reader :motions

  def initialize(head, tail)
    @head, @tail = head, tail
    @motions = []
    read_motions
  end

  def simulate
    @motions.each do |m|
      direction, count = m.split(' ').map do |s|
        if /\d+/.match?(s)
          s.to_i
        else
          s
        end
      end

      while count > 0
        plot(@head, direction)
        follow(direction)
        count -= 1
      end
    end
  end

  private

  def read_motions
    @motions = File.readlines(__dir__ + '/data.txt', chomp: true)
  end

  def plot(knot, direction)
    case direction
    when 'U' then up(knot)
    when 'R' then right(knot)
    when 'D' then down(knot)
    when 'L' then left(knot)
    else raise "Invalid direction supplied: #{direction}"
    end
  end

  def follow(direction)
    x_diff = @head.current_position[:x] - @tail.current_position[:x]
    y_diff = @head.current_position[:y] - @tail.current_position[:y]

    if x_diff.abs > 1 || y_diff.abs > 1
      if (x_diff.abs + y_diff.abs).between?(3, 4)
        head_prev = Knot.to_coords(@head.points[-2])
        @tail.add_point(head_prev[:x], head_prev[:y])
      else
        plot(@tail, direction)
      end
    end
  end

  def up(knot)
    current = knot.current_position
    knot.add_point(current[:x], current[:y] + 1)
  end

  def right(knot)
    current = knot.current_position
    knot.add_point(current[:x] + 1, current[:y])
  end

  def down(knot)
    current = knot.current_position
    knot.add_point(current[:x], current[:y] - 1)
  end

  def left(knot)
    current = knot.current_position
    knot.add_point(current[:x] - 1, current[:y])
  end
end
