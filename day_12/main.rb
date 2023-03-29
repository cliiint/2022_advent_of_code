require_relative 'graph'
require_relative 'vertex'

module Solution
  def part_1
    g = Graph.new
    lines = File.readlines(__dir__ + '/data.txt', chomp: true).map { |l| l.chars }
    lines.each.with_index do |l, y| # i is x coord
      l.each.with_index do |e, x| # is y coord
        vertex = Vertex.new(x, y, e)
        g.add_vertex(vertex)
        g.start = vertex if vertex.is_start
        g.finish = vertex if vertex.is_finish
      end
    end

    g.vertices.each do |v|
      neighbors = g.find_neighbors(v)
      neighbors.each { |n| g.add_edge(v, n, 1) }
    end

    g.dijkstra
  end

  module_function :part_1
end

Solution.part_1