require_relative 'priority_queue'

INFINITY = Float::INFINITY

# read vertices into g.adj_list, where key is x,y coords
# and enqueue nodes into queue
#   must also assign edges. i imagine the edge weight will always be 1, unless elevation is incompat
# dijkstra
#

class Graph
  def initialize
    @adjacency_list = {}
  end

  def add_vertex(vertex)
    @adjacency_list[vertex] = []
  end

  def add_edge(v1, v2, weight)
    @adjacency_list[v1] << { vertex: v2, weight: weight }
    @adjacency_list[v2] << { vertex: v1, weight: weight }
  end

  def dijkstra(start, finish)
    nodes = PriorityQueue.new
    distances = {} # a map of the shortest distance from start to each vertex
    previous = {} # the node that occurred before current, where current is the key. eg "shortest way to get from 0,1, is from 0,0" [0,1]: [0,0]
    path = []
    smallest = nil

    # initial state
    @adjacency_list.keys.each do |v|
      if v == start
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
      smallest = nodes.dequeue[:val][0]
      if smallest == finish
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
          next_neighbor = next_node[:vertex]
          if candidate < distances[next_neighbor]
            distances[next_neighbor] = candidate
            previous[next_neighbor] = smallest
            nodes.enqueue(next_neighbor, candidate)
          end
        end
      end
    end

    path.push(smallest)
    path.reverse
  end
end



