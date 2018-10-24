require '../node'

#426153
n = N.new(4, N.new(2, N.new(6, N.new(1, N.new(5, N.new(3, N.new(100)))))))


def merge_sort(n)
	front = n
	back = split(n)
	if !back
		return front
	end

	a = merge_sort(front)
	b = merge_sort(back)
	head = merge(a,b)

	return head
end


def merge(a,b)
	if !a
		return b
	end

	if !b
		return a
	end

	if a.name < b.name
		a.nxt = merge(a.nxt, b)
		return a
	end

	b.nxt = merge(a, b.nxt)
	return b
end

def split(n)
	if !n
		return nil
	end

	slow = n
	fast = n.nxt

	while fast
		fast = fast.nxt
		if fast
			slow = slow.nxt
			fast = fast.nxt
		end
	end

	back = slow.nxt
	slow.nxt = nil
	return back
end

def show(n)

end

N.show_linked(n)
sorted = merge_sort(n)
N.show_linked(sorted)
