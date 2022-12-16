require_relative '../../day_2/main'

describe RockPaperScissors do
  it 'should return an int' do
    expect(RockPaperScissors.play('A X')).to be_an_integer
  end
end