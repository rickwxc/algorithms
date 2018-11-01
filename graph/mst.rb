#https://www.geeksforgeeks.org/?p=26604/
#Kruskal’s Minimum Spanning Tree Algorithm | Greedy Algo-2

require '../node'


#          10
#        0--------1
#        |  \     |
#       6|   5\   |15
#        |      \ |
#        2--------3
#            4       

wg = WeightedGraph.new

wg.add_edge(0, 1, 10)
wg.add_edge(0, 2, 6)
wg.add_edge(0, 3, 5)
wg.add_edge(1, 3, 15)
wg.add_edge(2, 3, 4)


p wg.mst
