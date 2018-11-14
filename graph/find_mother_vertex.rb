#https://www.geeksforgeeks.org/topological-sorting/
require '../include.rb'

#find all mother vetex: Just print all the vertices in the same strongly connected components in which one of the mother vertex lie.

def run(g)
	edges = g.edges
	vertics = g.vertics
	last_finished = nil
	visited = []
	vertics.each do |u|
		if !visited.include? u
			dfs(u, edges, visited)
			last_finished = u
		end
	end
	visited = []
	dfs(last_finished, edges, visited)
	if vertics.size == visited.size
	p "mother vertex: #{last_finished}"
	end
end

def dfs(u, edges, visited)
	visited << u 
	edges[u].each do |v|
		if !visited.include? v
			dfs(v, edges, visited)
		end
	end if edges[u]
	
end

g0 = DirectGraph.new

g0.add_edge(0, 1); 
g0.add_edge(0, 2); 
g0.add_edge(1, 3); 
g0.add_edge(4, 1); 
g0.add_edge(5, 2); 
g0.add_edge(5, 6); 
g0.add_edge(6, 4); 
g0.add_edge(6, 0); 

run(g0)

g1 = DirectGraph.new

g1.add_edge(0, 2); 
g1.add_edge(0, 3); 
g1.add_edge(1, 0); 
g1.add_edge(2, 1); 
g1.add_edge(3, 4); 

run(g1)
