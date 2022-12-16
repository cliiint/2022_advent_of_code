class Tree
  attr_reader :height, :row, :column
  attr_accessor :visible

  def initialize(height, row, column)
    @height = height
    @row = row
    @column = column
    @visible = nil
  end
end