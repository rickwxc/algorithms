#Input : num = 12345
#Output : 54321
#
#Input : num = 876
#Output : 678


def reverse(n)
	remains = (n / 10).to_i
	last = n - 10 * remains
	if remains < 1 
		return [last]
	end

	stack = []
	stack << last
	r = reverse(remains)
	stack << r
	stack.flatten!
	stack
end

p reverse(12345)
p reverse(876)

