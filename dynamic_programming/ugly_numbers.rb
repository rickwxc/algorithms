#Ugly numbers are numbers whose only prime factors are 2, 3 or 5. The sequence 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, … shows the first 11 ugly numbers. By convention, 1 is included.

#Input  : n = 7 Output : 8
#Input  : n = 10 Output : 12
#Input  : n = 15 Output : 24
#Input  : n = 150 Output : 5832
#
$table = {}
def is_ugly(n)
	if n == 1
		return true
	end

	if !$table[n]

		if n % 2 == 0
			$table[n/2] = is_ugly(n/2)
			return $table[n/2] 
		end

		if n % 3 == 0
			$table[n/3] = is_ugly(n/3)
			return $table[n/3] 
		end

		if n % 5 == 0
			$table[n/5] = is_ugly(n/5)
			return $table[n/5] 
		end

		$table[n] = false
	end

	return $table[n]
end

def is_ugly_recur(n)
	if n == 1
		return true
	end

	if n % 2 == 0
		return is_ugly(n/2)
	end

	if n % 3 == 0
		return is_ugly(n/3)
	end

	if n % 5 == 0
		return is_ugly(n/5)
	end

	return false
end

def is_ugly_with_while(n)
	if n == 1
		return true
	end

	while  true

		if n % 2 == 0
			n = n / 2
			next
		end

		if n % 3 == 0
			n = n / 3
			next
		end

		if n % 5 == 0
			n = n / 5
			next
		end

		if n  == 1
			return true
		end

		return false
	end
end

def ugly_number_one_by_one(n)
	ary = []

	i = 0
	while ary.size != n
		i = i + 1
		if is_ugly(i)
			ary << i
			next
		end
	end

	ary[n-1]
end

def ugly_number_bottom_up(n)
	ary = [1]

	idx2 = 0
	idx3 = 0
	idx5 = 0

	next_2 = 2
	next_3 = 3
	next_5 = 5

	while ary.size != n
		min = [next_2, next_3, next_5].min
		ary << min
		if min == next_2
			idx2 = idx2 + 1
			next_2 = 2 * ary[idx2] 
		end
		
		if min == next_3
			idx3 = idx3 + 1
			next_3 = 3 * ary[idx3] 
		end

		if min == next_5
			idx5 = idx5 + 1
			next_5 = 5 * ary[idx5] 
		end
	end

	ary[n-1]
end


#Input  : n = 7 Output : 8
#Input  : n = 10 Output : 12
#Input  : n = 15 Output : 24
#Input  : n = 150 Output : 5832

p ugly_number_bottom_up(7)
p ugly_number_bottom_up(10)
p ugly_number_bottom_up(15)
p ugly_number_bottom_up(25)
p ugly_number_bottom_up(150)

 p is_ugly(8)
 p is_ugly(9)
 p is_ugly(12)
 p is_ugly(24)
# p is_ugly(5832)
 p is_ugly(49)
 p is_ugly(35)

p $table
