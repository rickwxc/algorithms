#https://www.geeksforgeeks.org/find-nth-magic-number/

# 5, 25, 30(5 + 25), 125, 130(125 + 5), ….
# 125 25 5
#        1
#     1  0
#     1  1
#  1  0  0
#  1  0  1
def get_magic(n)
	p n.to_s(2)
	pow = 1
	answer = 0
	while n > 0
		p "#{n} #{n.to_s(2)}"

		pow = pow * 5
		if n & 1 == 1
			answer = answer + pow 
		end

		n = n >> 1
	end

	answer
end

p get_magic(4)


