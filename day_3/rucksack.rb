class RuckSack
  attr_reader :compartment_1, :compartment_2, :priority

  def initialize(contents)
    compartmentalize(contents)
  end

  def compartmentalize(string)
    middle = string.length / 2
    @compartment_1 = string[..(middle - 1)]
    @compartment_2 = string[middle..]
  end

  def find_shared_item
    shared_item = nil
    @compartment_1.chars.each do |c|
      # TODO use index to cut down on time and not recheck previously checked pairs
      @compartment_2.chars.each do |d|
        if c == d
          shared_item = c
          break
        end
      end
      break unless shared_item.nil?
    end

    shared_item
  end
end