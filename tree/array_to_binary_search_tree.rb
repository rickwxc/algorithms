#https://www.geeksforgeeks.org/check-if-a-given-array-can-represent-preorder-traversal-of-binary-search-tree/


def array_to_binary_search_tree(ary)
	stack = [ary.shift]
	nge = {} 
	find_min = nil
	ary.each do |e|
		if find_min and e < find_min
			return false
		end
		while stack.size > 0 and stack[-1] < e
			find_min = stack.pop
			nge[find_min] = e
			next
		end
		stack << e
	end

	return true
end


p array_to_binary_search_tree([2, 4, 3])
p array_to_binary_search_tree([2, 4, 1])
p array_to_binary_search_tree([40, 30, 35, 80, 100])
p array_to_binary_search_tree([40, 30, 35, 20, 80, 100])

