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

