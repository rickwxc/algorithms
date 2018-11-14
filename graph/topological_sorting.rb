#https://www.geeksforgeeks.org/topological-sorting/
require '../include'

#We recommend to first see implementation of DFS here. We can modify DFS to find Topological Sorting of a graph. 
#In DFS, we start from a vertex, we first print it and then recursively call DFS for its adjacent vertices. 
#In topological sorting, we use a temporary stack. We don’t print the vertex immediately, we first recursively call topological sorting for all its adjacent vertices, then push it to a stack. 
#Finally, print contents of stack. 
#Note that a vertex is pushed to stack only when all of its adjacent vertices (and their adjacent vertices and so on) are already in stack.



def ts(v, edges, rs, stack)
	rs << v
	edges[v].each do |u|
		if !rs.include? u
			ts(u, edges, rs, stack)
		end
	end if edges[v]

	stack << v

	rs
end

def run(edges, vertics)
	stack = []
	rs = []
	vertics.each do |v|
		if !rs.include? v
			ts(v, edges, rs, stack)
		end
	end
	p rs
	p stack.reverse
end

g0 = DirectGraph.new

g0.add_edge(5, 2); 
g0.add_edge(5, 0); 
g0.add_edge(4, 0); 
g0.add_edge(4, 1); 
g0.add_edge(2, 3); 
g0.add_edge(3, 1); 


run(g0.edges, g0.vertics)

