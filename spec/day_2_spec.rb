require_relative '../day_2/day_2'

describe RockPaperScissors do
  it 'should return an int' do
    game = RockPaperScissors.new
    expect(game.play('A X')).to be_an_integer
  end
end