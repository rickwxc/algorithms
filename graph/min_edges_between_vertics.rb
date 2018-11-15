# https://www.geeksforgeeks.org/minimum-number-of-edges-between-two-vertices-of-a-graph/
require '../include'

def bfs(dest, edges, stack, parent)
  until stack.empty?
    cur_node = stack.shift
    edges[cur_node].each do |n|
      next if parent[n]

      parent[n] = cur_node
      stack << n
      return parent if dest == n
    end
  end
end

def show_path(parent, start, dest)
  p dest
  show_path(parent, start, parent[dest]) if start != dest
end

def find(graph, start, dest)
  stack = [start]
  parent = { start => nil }
  found = bfs(dest, graph.edges, stack, parent)
  show_path(parent, start, dest) if found
end

g1 = UndirectGraph.new

g1.add_edge(0, 1)
g1.add_edge(0, 2)
g1.add_edge(0, 4)
g1.add_edge(1, 2)
g1.add_edge(2, 5)
g1.add_edge(3, 4)
g1.add_edge(4, 5)
g1.add_edge(4, 6)

find(g1, 1, 5)
