class Node
	attr_reader :name
	attr_reader :nxt
	attr_reader :left
	attr_reader :right
	attr_writer :nxt
	attr_writer :left
	attr_writer :right

	def initialize(name, nxt=nil, left=nil, right=nil)
		@name = name
		@nxt = nxt
		@left = left
		@right = right
	end

	def self.show_linked(n)
		if !n
			print "\n"
			return
		end
		print n.name
		print ' '
		self.show_linked(n.nxt)
	end

end

class N < Node
end

def tn(name, left=nil, right=nil)
	if left.class.name == 'String' or left.class.name == 'Integer'
		left = N.new(left)
	end
	if right.class.name == 'String' or right.class.name == 'Integer'
		right = N.new(right)
	end

	N.new(name, nil, left, right)
end

def inorder(n, ary)
	if !n 
		return
	end
	 inorder(n.left, ary)
	ary << n.name
	 inorder(n.right, ary)

end

def preorder(n,ary)
	if !n 
		return
	end
		ary << n.name
	 inorder(n.left, ary)
	 inorder(n.right, ary)
end


class Graph

	def initialize(v)
		@v = v
		@edges = {}
	end

	def add_edge(v, w)
		@edges[v] ||= []
		@edges[v] << w
	end

	def dfs(start, visited)
		visited << start

		@edges[start].each do |n|
			if !(visited.include? n)
				self.dfs(n, visited)
			end
		end

		visited
	end

	def bfs(start)
		visited = []
		queue = [start]

		result = []
		while queue.size > 0
			n = queue.shift
			if visited.include? n
				next
			end

			result << n
			visited << n
			
			queue << @edges[n]
			queue.flatten!
		end

		result
	end

end

class WeightedGraph

	def initialize()
		@v = []
		@edges = []
	end

	def add_edge(a, b, weight = 0)
		@edges << [a, b, weight]

		if !(@v.include? a)
			@v << a
		end

		if !(@v.include? b)
			@v << b
		end
	end

	def sort_edge_by_weight(order_by = 'asc')
		edg = sort_ary(@edges, 2)
		if order_by == 'asc'
			edg.reverse!
		end

		edg
	end

	def sort_ary(ary, compare_idx)
		if ary.size == 0 
			return []
		end

		if ary.size == 1 
			return ary
		end

		hf = (ary.size / 2).to_i
		a = sort_ary(ary[0..(hf - 1)], compare_idx)
		b = sort_ary(ary[hf..-1], compare_idx)
		result = []
		while a.size > 0 && b.size > 0
			if a[0][compare_idx] > b[0][compare_idx]
				result << a.shift
			else
				result << b.shift
			end
		end
		a.each do |e|
			result << e
		end
		b.each do |e|
			result << e
		end

		result
	end

	def get_graph_matrix
		v =  @v.sort
		g = []

		v.each do |vt|
			ary = []
			v.each do |vt|
				ary << 0
			end
			g << ary
		end
		@edges.each do |e|
			g[e[0]][e[1]] = e[2]
		end
		g
	end

	def prim_mst
		v2v = get_v_to_vertics(@edges)
		start = 0
		edges = []
		current_grow = start
		included_v = [start]
		next_nodes = {}
		while edges.size != (@v.size - 1) do
			min = next_nodes(current_grow, included_v, v2v, next_nodes)
			edges << min[:e]
			included_v << min[:v]
			current_grow = min[:v]
		end

		edges
	end

	def next_nodes(current_grow, included_v, v2v, next_nodes)
		v2v[current_grow].each do |edge|
			if included_v.include? edge[:v]
				next
			end
			if !next_nodes[edge[:v]] or edge[:w] < next_nodes[edge[:v]][:w]
				next_nodes[edge[:v]] = {:w => edge[:w], :v => edge[:v], :e => [edge[:v], current_grow]}
			end
		end


		min = nil
		min_v = nil
		next_nodes.each do |v, n|
			min ||= n
			min_v ||= v
			if min[:w] > n[:w]
				min = n
				min_v = v
			end
		end

		next_nodes.delete min_v
		return min
	end

	def find_next_nodes(visited_v, v2v, next_nodes)
		visited_v.each do |vn|
			v2v[vn].each do |edge|
				if visited_v.include? edge[:v]
					next
				end
				next_nodes[edge[:v]] = {:w => edge[:w], :v => edge[:v], :e => [edge[:v], vn]}
			end
		end
	end

	def get_v_to_vertics(edges)
		rs = {}
		edges.each do |e|
			rs[e[0]] ||= []
			rs[e[1]] ||= []

			rs[e[0]] << {:v => e[1], :w => e[2]} 
			rs[e[1]] << {:v => e[0], :w => e[2]} 
		end

		rs
	end

	def mst
		#sort edge by weight
		edges = self.sort_edge_by_weight
		picked_edges = []

		while picked_edges.size < (@v.size - 1)
			picked_edges << edges.shift
			if self.has_cycle_with_rank(picked_edges)
				picked_edges.pop
			end
		end

		picked_edges
	end

	def find_parent(parent, v)
		 if parent[v] == -1
			 return v
		 end

		 return find_parent(parent, parent[v])
	end

	def union(parent, x, y)
		xset = find_parent(parent, x)
		yset = find_parent(parent, y)
		if xset != yset
			parent[xset] = yset
		end
	end

	def find_parent_with_rank(parents, v)
		 if parents[v][:parent] == -1
			 return v
		 end

		 return find_parent_with_rank(parents, parents[v][:parent])
	end

	def union_with_rank(parents, x, y)
		setx = self.find_parent_with_rank(parents, x)
		sety = self.find_parent_with_rank(parents, y)
		if parents[setx][:rank] == parents[sety][:rank]
			 parents[setx][:parent] = sety 
			 parents[sety][:rank] =  1 + parents[sety][:rank] 
		elsif parents[setx][:rank] > parents[sety][:rank]
			 parents[sety][:parent] = setx 
		else
			 parents[setx][:parent] = sety 
		end
	end

	def has_cycle_with_rank(edges = nil)
		edges ||= @edges

		parents = {} 
		@v.each do |e|
			parents[e] = {
				:parent => -1,
				:rank => -1,
			}
		end

		edges.each do |e|
		    x = self.find_parent_with_rank(parents, e[0])
			y = self.find_parent_with_rank(parents, e[1]) 
			if  x == y
				return true
			end
			self.union_with_rank(parents, x, y)
		end

		return false
	end


	def has_cycle(edges = nil)
		edges ||= @edges

		parent = {} 
		@v.each do |e|
			parent[e] = -1
		end

		edges.each do |e|
			x = self.find_parent(parent, e[0])
			y = self.find_parent(parent, e[1]) 
			if  x == y
				return true
			end
			self.union(parent, x, y)
		end

		return false
	end

end
