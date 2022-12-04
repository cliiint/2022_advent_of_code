class Elf
  attr_accessor :food_items
  attr_reader :calories

  def initialize
    @food_items = []
  end

  def calories
    @food_items.sum
  end
end