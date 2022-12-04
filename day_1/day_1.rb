require_relative 'elf'

elves = []

file = File.open(__dir__ + "/data.txt")
stack = []
file.each do |l|
  clean_line = l.chomp
  if clean_line.empty? || file.eof?
    if file.eof?
      stack.push(clean_line.to_i)
    end
    elf = Elf.new
    elf.food_items = stack
    elves.push(elf)
    stack = []
  else
    stack.push(clean_line.to_i)
  end
end
file.close


calories_mapped = elves.map { |e| e.food_items.sum }
top_3 = calories_mapped.sort { |a, b| a - b }[(calories_mapped.length - 3)..(calories_mapped.length - 1)]
pp top_3.sum
# 197400
#
# greatest_calories = elves.map { |e| e.food_items.sum }.max
# 69206
