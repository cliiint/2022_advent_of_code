# A == X (rock): 1pt
# B == Y (paper): 2pt
# C == Z (scissors): 3pt
#
# lose: 0pt
# draw: 3pt
# win: 6pt

POINTS_MAP = {
  'A X': 4,
  'A Y': 8,
  'A Z': 3,
  'B X': 1,
  'B Y': 5,
  'B Z': 9,
  'C X': 7,
  'C Y': 2,
  'C Z': 6
}

# X: need to lose
# Y: need to draw
# Z: need to win

POINTS_MAP_PART_TWO = {
  'A X': 3,
  'A Y': 4,
  'A Z': 8,
  'B X': 1,
  'B Y': 5,
  'B Z': 9,
  'C X': 2,
  'C Y': 6,
  'C Z': 7
}

class RockPaperScissors
  def self.play(game)
    POINTS_MAP[game.to_sym]
  end

  def self.play_part_two(game)
    POINTS_MAP_PART_TWO[game.to_sym]
  end
end

lines = File.readlines(__dir__ + '/data.txt', chomp: true)
sum = 0
lines.each { |l| sum += RockPaperScissors.play(l) }
# 10994

sum_two = 0
lines.each {|l| sum_two += RockPaperScissors.play_part_two(l)}
p sum_two
# wrong, too high: 12857
# correct: 12526