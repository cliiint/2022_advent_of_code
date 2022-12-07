require_relative 'rucksack'
require_relative 'priority'

# Part 1
prioritized_items = []

file = File.open(__dir__ + '/data.txt')
file.each do |l|
  rucksack = RuckSack.new(l.chomp)
  prioritized_items << rucksack.find_shared_item
end
file.close

priority_values = prioritized_items.map do |i|
  i.match?(/[A-Z]/) ? Priority::UPPERCASE[i.to_sym] : Priority::LOWERCASE[i.to_sym]
end

solution = priority_values.sum
# 7811

# Part 2
def build_hash(*strs)
  hash = {}
  strs.each do |s|
    s.chars.uniq.each do |c|
      if hash[c]
        hash[c] += 1
      else
        hash[c] = 1
      end
    end
  end
  hash
end

groups = []
stack = []

file = File.open(__dir__ + '/data.txt')
file.each do |l|
  rucksack = RuckSack.new(l.chomp)
  stack << rucksack
  if stack.length == 3
    groups << stack
    stack = []
  end
end
file.close

group_prioritized_items = []

groups.each do |g|
  hash = build_hash(g[0].all_items, g[1].all_items, g[2].all_items)
  hash.each do |k, v|
    group_prioritized_items << k if v >= 3
  end
end

group_values = group_prioritized_items.map do |i|
  i.match?(/[A-Z]/) ? Priority::UPPERCASE[i.to_sym] : Priority::LOWERCASE[i.to_sym]
end

# group_values.sum
# too low: 2587
# 2639