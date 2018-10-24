require '../node'


n = Node.new(1, nil, Node.new(2, nil, Node.new(4), Node.new(5)), Node.new(3))
n2 = Node.new(1, nil, N.new(5, nil, N.new(4)))


def find_min_depth(n)

	if !n 
		return 0
	end

	if !n.left && !n.right
		return 1
	end
	if !n.left
		return 1 + find_min_depth(n.right)
	end

	if !n.right
		return 1 + find_min_depth(n.left)
	end

	a = 1 + find_min_depth(n.left)
	b = 1 + find_min_depth(n.right)

	if a > b
		return b
	end

	return a

end

p find_min_depth(n)
p find_min_depth(n2)
