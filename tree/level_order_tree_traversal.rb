require '../node'
n5 = Node.new(5)
n4 = Node.new(4)
n3 = Node.new(3)
n2 = Node.new(2)
n1 = Node.new(1)

n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5


#     1
#  2    3
#4   5
#12345
# fifo queue
def level_order(node)
	list = []
	result = []
	list << node
	while list.size > 0
		n = list.shift
		result << n
		if n.left
			list << n.left
		end
		if n.right
			list << n.right
		end
	end

	result
end

list = level_order(n1)

list.each do |n|
	p n.name
end
