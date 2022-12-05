# define a RuckSack class that has
# @compartment_1 and @compartment_2 (str) *define on init
# @shared_item (str) *define on init
# @priority sum (number) *define on init
#
# def compartmentalize
# def find_shared_item (algorithm)
#   O(n^2)
#   cave man it, iterate each string
#   and compare, (if?) when there is a match
#   exit and store @shared_item
# def priority sum (accessor)
#
# create priority constants
# LOWERCASE_PRIORITY
# UPPERCASE_PRIORITY
#
# read through data file,
# split each line in half, and use it to create rucksacks
#

require_relative 'rucksack'
require_relative 'priority'

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