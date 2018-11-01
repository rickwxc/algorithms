#https://www.geeksforgeeks.org/union-find/
require '../node'


wg = WeightedGraph.new

wg.add_edge(0, 1, 0)
wg.add_edge(1, 2, 0)
wg.add_edge(0, 2, 0)

p wg.has_cycle

wg = WeightedGraph.new

wg.add_edge(0, 1, 0)
wg.add_edge(1, 2, 0)
p wg.has_cycle



wg = WeightedGraph.new

wg.add_edge(0, 1, 0)
wg.add_edge(0, 2, 0)
wg.add_edge(1, 3, 0)
wg.add_edge(1, 4, 0)
p wg.has_cycle
p wg.has_cycle_with_rank

wg.add_edge(3, 4, 0)
p wg.has_cycle

p wg.has_cycle_with_rank
