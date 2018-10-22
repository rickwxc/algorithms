class Node
	attr_reader :name
	attr_reader :nxt
	attr_reader :left
	attr_reader :right
	attr_writer :nxt
	attr_writer :left
	attr_writer :right

	def initialize(name)
		@name = name
	end

end
