#https://www.geeksforgeeks.org/next-greater-element/

#4 3 5 2 8 9

def prt_next_greater_element(ary)
	stack = [ary.shift]
	result = {} 
	ary.each do |e|

		while (stack.size > 0) && e > stack[-1]
			result[stack.pop] = e
		end

		stack << e
	end

	stack.each do |e|
		result[e] = -1
	end
	result
end

ary = [4, 5, 2, 25]
p ary
p prt_next_greater_element(ary)

ary = [13, 7, 6, 12]
p ary
p prt_next_greater_element(ary)

ary = [13, 7, 6, 5,4,3,2, 12]
p ary
p prt_next_greater_element(ary)

ary = [13, 7, 6, 5,4,3,2, 1]
p ary
p prt_next_greater_element(ary)
