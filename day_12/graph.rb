require_relative 'priority_queue'
require_relative 'vertex'

INFINITY = Float::INFINITY

class Graph
  attr_accessor :start, :finish
  attr_reader :adjacency_list, :vertices

  def initialize
    @adjacency_list = {}
    @vertices = []
    @start = nil
    @finish = nil
  end

  def add_vertex(vertex)
    @vertices << vertex
    @adjacency_list[vertex.key] = []
  end

  def add_edge(v1, v2, weight)
    @adjacency_list[v1.key] << { vertex: v2, weight: weight }
  end

  def find_neighbors(v)
    x, y = v.x_coord, v.y_coord
    up = "#{x},#{y - 1}"
    right = "#{x + 1},#{y}"
    down = "#{x},#{y + 1}"
    left = "#{x - 1},#{y}"

    neighbors = []

    [up, right, down, left].each do |c|
      viable_neighbor = viable_neighbor(c, v.elevation)
      neighbors << viable_neighbor unless viable_neighbor.nil?
    end

    neighbors
  end

  def dijkstra
    nodes = PriorityQueue.new
    distances = {} # a map of the shortest distance from start to each vertex
    previous = {} # the node that occurred before current, where current is the key. eg "shortest way to get from 0,1, is from 0,0" [0,1]: [0,0]
    path = []
    smallest = nil

    # initial state
    @adjacency_list.keys.each do |v|
      if v == @start.key
        distances[v] = 0
        nodes.enqueue(v, 0)
      else
        distances[v] = INFINITY
        nodes.enqueue(v, INFINITY)
      end

      previous[v] = nil
    end

    # as long as there is something to visit
    while nodes.queue.count > 0
      smallest = nodes.dequeue[:val]
      if smallest == @finish.key
        # done, need to build path to return
        while previous[smallest]
          path << smallest
          smallest = previous[smallest]
        end

        break
      end

      if smallest || distances[smallest] != INFINITY
        @adjacency_list[smallest].each.with_index do |neighbor, i|
          next_node = @adjacency_list[smallest][i]
          candidate = distances[smallest] + next_node[:weight]
          next_neighbor = next_node[:vertex].key
          if candidate < distances[next_neighbor]
            distances[next_neighbor] = candidate
            previous[next_neighbor] = smallest
            nodes.enqueue(next_neighbor, candidate)
          end
        end
      end
    end

    path.reverse
  end

  private

  def to_coords(str)
    str.split(',').map(&:to_i)
  end

  def to_string(x, y)
    "#{x},#{y}"
  end

  def find_vertex(coords)
    @vertices.select { |v| v.key == coords }[0]
  end

  def viable_neighbor(str, e)
    x, y = to_coords(str)
    if x < 0 || y < 0
      return nil
    end
    coords = to_string(x,y)
    vertex = find_vertex(coords)
    if vertex.nil?
      return nil
    end
    valid_elevation = vertex.elevation <= e + 1

    if !valid_elevation
      return nil
    else
      return vertex
    end
  end
end



