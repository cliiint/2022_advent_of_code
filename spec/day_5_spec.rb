require_relative '../day_5/main'

describe Solution do
  solution = Solution.new

  it 'should initialize all required stacks' do
    expect(solution.instance_variable_defined?("@s_1")).to eq(true)
    expect(solution.instance_variable_defined?("@s_9")).to eq(true)
  end
end