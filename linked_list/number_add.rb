#https://www.geeksforgeeks.org/sum-of-two-linked-lists/

require '../node'
n =                   N.new(1, N.new(2, N.new(3)))
m = N.new(9, N.new(7, N.new(1, N.new(2, N.new(4)))))

#123
#97124

def add(n,m)
	stackn = []
	p = n
	while p
		stackn << p
		p = p.nxt
	end

	stackm = []
	p = m
	while p
		stackm << p
		p = p.nxt
	end

	rs = []
	while stackn.size != 0 || stackm.size != 0
		tn = 0
		tm = 0
		if stackn.size != 0
			tn = dig * (stackn.pop).name
		end

		if stackm.size != 0
			tm = dig * (stackm.pop).name
		end

		rs << tn + tm
	end


	rs

end
p add(n, m)
