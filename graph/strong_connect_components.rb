#https://www.geeksforgeeks.org/strongly-connected-components/
require '../include'

def dfs(v, edges, mark, stack)
	mark['nodes'][v] ||= {}
	mark['nodes'][v]['s'] = mark['dis']

	mark['dis'] = mark['dis'] + 1
	edges[v].each do |u|
		if !mark['nodes'][u]
			dfs(u, edges, mark, stack)
		end
	end if edges[v]

	mark['nodes'][v]['e'] = mark['dis']
	mark['dis'] = mark['dis'] + 1
	stack << v
end

def dfs_step2(u, edges, visited)
	component = []
	component << u
	visited << u
	edges[u].each do |v|
		if !visited.include? v
			 component << dfs_step2(v, edges, visited)
		end
	end if edges[u]

	component.flatten
end

def run(g)
	mark = {
		'dis' => 1,
		'nodes' => {
		
		}
	}
	stack = []

	g.vertics.each do |v|
		if !mark['nodes'][v]
			dfs(v, g.edges, mark, stack)
		end
	end
	p mark
	p stack
	reverse_edges = g.reverse_edges
	p reverse_edges

	visited = []
	while stack.size > 0
		u = stack.pop
		if visited.include? u
			next
		end
		component = dfs_step2(u, reverse_edges, visited)
		p "SCC: #{component}"
	end

end

g0 = DirectGraph.new

g0.add_edge(0, 1); 
g0.add_edge(1, 2); 
g0.add_edge(2, 3); 
g0.add_edge(2, 4); 
g0.add_edge(3, 0); 
g0.add_edge(4, 5); 
g0.add_edge(5, 6); 
g0.add_edge(6, 4); 
g0.add_edge(7, 6); 
g0.add_edge(7, 8); 


run(g0)


g1 = DirectGraph.new

g1.add_edge(0, 2); 
g1.add_edge(0, 3); 
g1.add_edge(1, 0); 
g1.add_edge(2, 1); 
g1.add_edge(3, 4); 

run(g1)
