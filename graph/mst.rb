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

wg = WeightedGraph.new
wg.add_edge( 7,      6,1  )      
wg.add_edge( 8,      2,2  )      
wg.add_edge( 6,      5,2  )      
wg.add_edge( 0,      1,4  )      
wg.add_edge( 2,      5,4  )      
wg.add_edge( 8,      6,6  )      
wg.add_edge( 2,      3,7  )      
wg.add_edge( 7,      8,7  )      
wg.add_edge( 0,      7,8  )      
wg.add_edge( 1,      2,8  )      
wg.add_edge( 3,      4,9  )      
wg.add_edge( 5,      4,10 )      
wg.add_edge( 1,      7,11 )      
wg.add_edge( 3,      5,14 )      
p wg.mst

p "prim's mst"
p wg.prim_mst



#
#        2   3 
#    (0)--(1)--(2) 
#    |    / \    | 
#   6|  8/   \5  |7 
#    |  /     \  | 
#    (3)-------(4) 
#            9         
#int graph[V][V] =  {{0, 2, 0, 6, 0}, 
#                    {2, 0, 3, 8, 5}, 
#                    {0, 3, 0, 0, 7}, 
#                    {6, 8, 0, 0, 9}, 
#                    {0, 5, 7, 9, 0}}; 
