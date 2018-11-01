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

	def mst
		#sort edge by weight
		edges = self.sort_edge_by_weight
		picked_edges = []

		while picked_edges.size < (@v.size - 1)
			picked_edges << edges.shift
			if self.has_cycle(picked_edges)
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

	def has_cycle(edges = nil)
		edges ||= @edges

		parent = {} 
		@v.each do |e|
			parent[e] = -1
		end

		edges.each do |e|
			if self.find_parent(parent, e[0]) == self.find_parent(parent, e[1]) 
				return true
			end
			self.union(parent, e[0], e[1])
		end

		return false
	end

end
