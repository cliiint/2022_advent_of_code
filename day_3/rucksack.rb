class RuckSack
  attr_reader :compartment_1, :compartment_2, :priority_sum, :shared_item

  def initialize(contents)
    compartmentalize(contents)
    shared_item
  end

  def compartmentalize(string)
    middle = string.length / 2
    @compartment_1 = string[0..(middle - 1)]
    @compartment_2 = string[middle..string.length]
  end

  def shared_item
    @compartment_1.chars.each do |c|
      # TODO use index to cut down on time and not recheck previously checked pairs
      @compartment_2.chars.each do |d|
        if c == d
          @shared_item = c
          break
        end
        break if @shared_item
      end
    end
  end
end