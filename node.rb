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

