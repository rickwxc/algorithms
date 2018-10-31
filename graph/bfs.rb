require '../node'


g = Graph.new(4)

g.add_edge(0, 1); 
g.add_edge(0, 2); 
g.add_edge(1, 2); 
g.add_edge(2, 0); 
g.add_edge(2, 3); 
g.add_edge(3, 3); 

p g.bfs(2)
