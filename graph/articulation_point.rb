#https://www.geeksforgeeks.org/articulation-points-or-cut-vertices-in-a-graph/
require '../include'

def artp(u, arg_edges, visited, disc, low, parent, ap) 

	visited << u
	disc['nodes'][u] = disc['val']
	low[u] = disc['val']
	disc['val'] =  1 + disc['val']
	children = 0

	arg_edges[u].each do |v|
		if !(visited.include? v)
			parent[v] = u
			children = children + 1
			artp(v, arg_edges, visited, disc, low, parent, ap) 
			low[u] = [low[u], low[v]].min

			# (1) u is root of DFS tree and has two or more chilren. 
            if !parent[u] and children > 1 
				p "1) #{u} #{children}"
				ap[u] = true 
			end
  
            # (2) If u is not root and low value of one of its child is more 
            # than discovery value of u. 
            if !parent[u] and low[v] >= disc['nodes'][u] 
				p "2) #{u} "
               ap[u] = true 
			end


		elsif parent[u] != v
			# backedge
			low[u] = [low[u], disc['nodes'][v]].min
		end

	end if arg_edges[u]
end

def run(n, arg_edges) 

	disc = {
		'val' => 1,
		'nodes' => {

		} 
	}
	visited = []
	low = {}
	parent = {}
	ap = {}

	artp(n, arg_edges, visited, disc, low, parent, ap) 

	p low
	p ap
end

g0 = UndirectGraph.new

g0.add_edge('a', 'b'); 
g0.add_edge('a', 'h'); 

g0.add_edge('b', 'c'); 
g0.add_edge('b', 'h'); 
g0.add_edge('c', 'd'); 
g0.add_edge('c', 'k'); 
g0.add_edge('c', 'e'); 

g0.add_edge('d', 'f'); 
g0.add_edge('d', 'i'); 

g0.add_edge('f', 'i'); 
g0.add_edge('i', 'k'); 

g0.add_edge('e', 'g'); 
g0.add_edge('e', 'h'); 
g0.add_edge('h', 'j'); 
g0.add_edge('h', 'l'); 
g0.add_edge('j', 'l'); 
g0.add_edge('l', 'm'); 

run('a', g0.edges) 


g = UndirectGraph.new

g.add_edge(1, 4); 
g.add_edge(1, 2); 
g.add_edge(4, 3); 
g.add_edge(3, 5); 
g.add_edge(3, 6); 
g.add_edge(3, 2); 
g.add_edge(5, 6); 

run(1, g.edges) 

g1 = UndirectGraph.new

g1.add_edge(0, 1); 
g1.add_edge(0, 2); 
g1.add_edge(1, 2); 
g1.add_edge(2, 3); 
g1.add_edge(2, 5); 
g1.add_edge(3, 4); 
g1.add_edge(5, 8); 
g1.add_edge(5, 6); 
g1.add_edge(6, 7); 
g1.add_edge(7, 8); 

run(0, g1.edges) 

