


#1 1 2 3 5 8 13
def fib_start_with_1(n)
	#base
	#f1 = 1 f2 = 1
	if n <= 0
		return 0
	end

	if n <= 2
		return 1
	end

	return fib_start_with_1(n-1) + fib_start_with_1(n-2)
end


# 0 1 1 2 3 5 8 13
def fib_start_with_0(n)
	#base
	#f0 = 0 f1 = 1
	if n <= 1
		return n
	end

	return fib_start_with_0(n-1) + fib_start_with_0(n-2)
end

# 0 1 1 2 3 5 8 13
$values ={} 
#a) Memoization (Top Down)
def fib_with_dp(n)

	if n <= 1
		return n
	end

	if !$values[n]
		$values[n] = fib_with_dp(n - 1) + fib_with_dp(n - 2)
		p "#{n} no"  
	else
		p "#{n} yes"  
	end

	return  $values[n] 
end

def fib_bottom_up(n)
	ary = [0, 1]
	for i in 2..n 
		ary[i] = ary[i-1] + ary[i-2]
	end

	ary[n] 
end

p fib_start_with_0(10)
p fib_start_with_1(10)

p fib_with_dp(10)
p fib_bottom_up(10)

p fib_with_dp(9)
p fib_bottom_up(9)
