require '../node'

n6 = Node.new(6)
n5 = Node.new(5)
n4 = Node.new(4)
n3 = Node.new(3)
n2 = Node.new(2)
n1 = Node.new(1)
n0 = Node.new(0)
n0.nxt = n1
n1.nxt = n2
n2.nxt = n3
n3.nxt = n4
n4.nxt = n5
n5.nxt = n6
n6.nxt = n2


# Function to remove loop. 
# loop_node --> Pointer to one of the loop nodes 
# head -->  Pointer to the start node of the linked list

def removeLoop(looped, head) 
	step1 = head

	while true

		step2 = looped
		while (step2.nxt != looped and step2.nxt != step1)
			p "-> #{step1.name} #{step2.name}"
			step2 = step2.nxt
		end

		if step2.nxt == step1
			p step2.name
			p step1.name

			step2.nxt = nil
			p head 
			return
		end

		step1 = step1.nxt
	end


end


# 0 1 2 3 4 5 6->3
def find_loop(n)
	slow = n
	fast = n
	while (slow && fast && fast.nxt)

		slow = slow.nxt
		fast = fast.nxt.nxt

		if slow.name == fast.name
			removeLoop(fast, n) 
			return true
		end
	end

	return false
end

p find_loop(n0)

