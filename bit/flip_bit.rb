#https://www.geeksforgeeks.org/count-number-of-bits-to-be-flipped-to-convert-a-to-b/
#Input : a = 10, b = 20
#Output : 4
#Binary representation of a is 00001010
#Binary representation of b is 00010100
#We need to flip highlighted four bits in a
#to make it b.
#
#Input : a = 7, b = 10
#Output : 3
#Binary representation of a is 00000111
#Binary representation of b is 00001010
#We need to flip highlighted three bits in a
#to make it b.

def bit_flip_count(a, b)
	r = a ^ b
	count = 0

	while r >= 1
		if r & 1 == 1
			count = count + 1
		end
		r = r >> 1
	end

	p a.to_s(2)
	p b.to_s(2)
	p r.to_s(2)

	count
end


p bit_flip_count(10, 20)
p bit_flip_count(7, 10)
