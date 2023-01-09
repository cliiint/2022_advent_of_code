class Point
  attr_accessor :coords

  def initialize(x, y)
    @x_coord, @y_coord = x, y
  end

  def coords
    [@x_coord, @y_coord]
  end
end