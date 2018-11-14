require '../include'


def run(n, edges, vertics)
	rs = []
	vertics.each do |n|
		if !rs.include? n
			dfs(n, edges, rs)
		end
	end

	p rs
end

def dfs(u, edges, rs)
	rs << u
	edges[u].each do |v|
		if !rs.include? v
			dfs(v, edges, rs)
		end
	end if edges[u]

	rs
end



g0 = DirectGraph.new

g0.add_edge(5, 2); 
g0.add_edge(5, 0); 
g0.add_edge(4, 0); 
g0.add_edge(4, 1); 
g0.add_edge(2, 3); 
g0.add_edge(3, 1); 

run(5, g0.edges, g0.vertics)
