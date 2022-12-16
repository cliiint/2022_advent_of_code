require_relative '../../day_8/tree_grid'

describe TreeGrid do
  before(:context) do
    file = File.open(__dir__ + '/sample_data.txt')
    @grid = TreeGrid.new(file)
    file.close
  end

  it 'populates trees on init' do
    expect(@grid.trees.count).to eq(25)
  end

  it 'counts sample case correctly' do
    expect(@grid.visible_count).to eq(21)
  end
end