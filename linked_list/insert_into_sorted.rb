#https://www.geeksforgeeks.org/given-a-linked-list-which-is-sorted-how-will-you-insert-in-sorted-way/



require '../node'


n = N.new(2, N.new(4, N.new(6,N.new(8,N.new(10)))))


def insert(head, n)
	if head == nil
		return n
	end

	if head.name < n.name
		head.nxt = insert(head.nxt, n)
		return head
	end

	n.nxt = head
	return n
end

N.show_linked(n)
x = insert(n, N.new(1))
N.show_linked(x)
x = insert(x, N.new(5))
N.show_linked(x)
x = insert(x, N.new(11))
N.show_linked(x)


