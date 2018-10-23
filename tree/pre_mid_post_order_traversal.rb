require '../node'


n = Node.new(1, nil, Node.new(2, nil, Node.new(4), Node.new(5, nil, Node.new(8), Node.new(9))), Node.new(3, nil, Node.new(6), Node.new(7)))

#                      1
#                    /    \
#                  2       3
#                /   \    /   \
#              4      5 6     7
#                    / \      
#                  8    9 

#
#
# pre 124589367
# post 489526731
# mid 428591637
def preorder(node)
	if !node
		return
	end
	print node.name
	preorder(node.left)
	preorder(node.right)
end

def midorder(node)
	if !node
		return
	end
	midorder(node.left)
	print node.name
	midorder(node.right)
end

def postorder(node)
	if !node
		return
	end
	postorder(node.left)
	postorder(node.right)
	print node.name
end

preorder(n)
print "\n"

postorder(n)
print "\n"

midorder(n)
print "\n"
