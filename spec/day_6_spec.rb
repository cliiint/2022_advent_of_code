require_relative '../day_6/main'

describe Solution do
  solution = Solution.new

  it 'should hit test cases' do
    expect(solution.part_1('bvwbjplbgvbhsrlpgdmjqwftvncz')).to eq(5)
    expect(solution.part_1('nppdvjthqldpwncqszvftbrmjlhg')).to eq(6)
    expect(solution.part_1('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg')).to eq(10)
    expect(solution.part_1('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')).to eq(11)
  end

  it 'should identify expected start of message markers' do
    expect(solution.part_2('mjqjpqmgbljsphdztnvjfqwrcgsmlb')).to eq(19)
    expect(solution.part_2('bvwbjplbgvbhsrlpgdmjqwftvncz')).to eq(23)
    expect(solution.part_2('nppdvjthqldpwncqszvftbrmjlhg')).to eq(23)
    expect(solution.part_2('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')).to eq(26)
  end
end