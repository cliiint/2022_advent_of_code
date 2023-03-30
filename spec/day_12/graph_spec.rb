require_relative '../../day_12/graph'

describe Graph do
  it 'initializes with no vertices' do
    graph = Graph.new

    expect(graph.vertices).to eq([])
  end

  it 'finds shortest path in sample data' do
    g = Graph.new
    lines = File.readlines(__dir__ + '/sample.txt', chomp: true).map { |l| l.chars }
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

    step_count = g.dijkstra.count

    expect(step_count).to eq(31)
  end
end