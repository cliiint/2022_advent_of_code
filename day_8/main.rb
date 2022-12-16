=begin
sub probs
1. the input file has to be read

2. each character (tree) has to be stored in memory,
  each tree needs to be accessible in
  memory at all times, not just in time as each line
  of the input is read.

  one way this could be achieved is to init an array grid,
  read the input line by line. also, a row counter would need
  to be initted and incremented so that row number can be
  tracked. for each line:
    create a new row array, and push each tree to it while iterating the line.
    finally, push the array to the grid array. to access the third
    tree on the fourth row, do
    grid[3][2]


3. iterate each tree in the grid and determine if its visible,
incrementing a result variable if it is

once all trees are mapped out in memory,
trees to its top, right, bottom, and left
need to be evaluated, maybe working from perimeter inward?

**a tree only needs to be visible from 1/4
sides in order for it to count.

to check top trees from pointer (example: grid[3][2]), could do
something like:
  row = 0
  visible = true
  while row is < 3 && visible
    compare base tree to this tree and increment row
  end

  visible

  then, repeat this similarly for other directions, returning
  the result of top || right || bottom || left
  if true, increment sum of visible trees
  there is also an edge (lol) case for perimeter trees.
  if there is no tree to one direction (eg. current tree is
  in first or last row/column), it is automatically visible.
=end