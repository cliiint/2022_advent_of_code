class TreeGrid
  attr_reader :trees, :visible_count

  def initialize(file)
    @trees = []
    @visible_count = 0
    populate(file)
  end

  def add_tree(tree)
    @trees.push(tree)

    @trees
  end

  private

    def populate(file)
      file.each.with_index do |line, row|
        line.chomp!
        line.each_char.with_index do |char, col|
          add_tree(Tree.new(char.to_i, row, col))
        end
      end

      set_tree_visibility
    end

    def set_tree_visibility
      @trees.each do |t|
        visible = is_visible?(t)
        @visible_count += 1 if visible
        t.visible = visible
      end
    end

    def is_visible?(tree)
      obstructing_top_trees = @trees.select do |t|
        t.row < tree.row && t.column == tree.column && t.height >= tree.height
      end

      obstructing_right_trees = @trees.select do |t|
        t.row == tree.row && t.column > tree.column && t.height >= tree.height
      end

      obstructing_bottom_trees = @trees.select do |t|
        t.row > tree.row && t.column == tree.column && t.height >= tree.height
      end

      obstructing_left_trees = @trees.select do |t|
        t.row == tree.row && t.column < tree.column && t.height >= tree.height
      end

      visible_from_top = obstructing_top_trees.count == 0
      visible_from_right = obstructing_right_trees.count == 0
      visible_from_bottom = obstructing_bottom_trees.count == 0
      visible_from_left = obstructing_left_trees.count == 0

      visible_from_top || visible_from_right || visible_from_bottom || visible_from_left
    end
end