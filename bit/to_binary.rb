#https://www.geeksforgeeks.org/binary-representation-of-a-given-number/

def to_bin(n)

	if n > 1
	 to_bin(n >> 1)
	end
	p "#{n.to_s(2)}"

	p (n & 1) 
end


to_bin(8)

