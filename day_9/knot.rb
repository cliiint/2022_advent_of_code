require 'set'

class Knot
  attr_reader :points

  def initialize
    @points = ['0,0']
  end

  def add_point(x, y)
    @points << "#{x},#{y}"
  end

  def current_position
    Knot.to_coords(@points.last)
  end

  def unique_positions
    set = Set.new(@points)
    set.count
  end

  def self.to_coords(str)
    hash = {}
    hash[:x], hash[:y] = str.split(',').map { |s| s.to_i }
    hash
  end
end
