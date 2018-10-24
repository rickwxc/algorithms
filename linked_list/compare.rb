#https://www.geeksforgeeks.org/compare-two-strings-represented-as-linked-lists/

require '../node'
a = N.new('g', N.new('e', N.new('e', N.new('k', N.new('a')))))
b = N.new('g', N.new('e', N.new('e', N.new('k', N.new('b')))))
c = N.new('g', N.new('e', N.new('e', N.new('k', N.new('a')))))
d = N.new('g', N.new('e', N.new('e', N.new('k', N.new('a', N.new('d'))))))


def compare(a,b)
	if !a && !b
		return 0
	end

	if !a && b
		return 'a < b'
	end

	if !b && a
		return 'a > b'
	end

	if a.name > b.name
		return 1
	end

	if a.name < b.name
		return -1
	end

	if a.name == b.name
		return compare(a.nxt, b.nxt)
	end
end


p compare(a,b)
p compare(a,c)
p compare(a,d)
p compare(d,a)

