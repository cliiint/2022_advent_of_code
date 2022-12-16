require_relative '../../day_8/tree'

describe Tree do
  let(:tree) { Tree.new(6, 2, 6) }

  it 'has a row and column' do
    expect(tree.row).to eq(2)
    expect(tree.column).to eq(6)
  end

  it 'has an height that is an int' do
    expect(tree.height).to be_an_instance_of(Integer)
  end

  it 'can be updated to be visible' do
    tree.visible = true
    expect(tree.visible).to eq(true)
  end
end
