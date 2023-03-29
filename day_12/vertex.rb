class Vertex
  attr_reader :key, :elevation, :x_coord, :y_coord, :is_start, :is_finish

  def initialize(x, y, elevation)
    @x_coord, @y_coord = x, y
    @key = coords_to_str(x, y)
    @is_start = elevation == 'S'
    @is_finish = elevation == 'E'
    @elevation = calc_elevation(elevation)
  end

  private

  def calc_elevation(elevation)
    if elevation == 'S'
      97
    elsif elevation == 'E'
      122
    else
      elevation.ord
    end
  end

  def coords_to_str(x, y)
    "#{x},#{y}"
  end
end