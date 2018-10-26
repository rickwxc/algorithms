
#Input:  arr[] = {10, 12, 11};
#Output: Length of the longest contiguous subarray is 3

#Input:  arr[] = {14, 12, 11, 20};
#Output: Length of the longest contiguous subarray is 2

#Input:  arr[] = {1, 56, 58, 57, 90, 92, 94, 93, 91, 45};
#Output: Length of the longest contiguous subarray is 5

ary = [1, 56, 58, 57, 90, 92, 94, 93, 91, 45]
ary1 = [14, 12, 11, 20]
ary2 = [10, 12, 11]
ary3 = [1,90, 56, 58, 57, 92, 94, 93, 91, 45]



#[123]

def lg(ary)
	if ary.size == 0
		return []
	end

	if (ary.max - ary.min) == (ary.size - 1)
		return ary
	end

	a = lg(ary[1..-1])
	b = lg(ary[0..-2])

	if a.size > b.size
		return a
	end

	return b
end

p lg(ary)
p lg(ary1)
p lg(ary2)
p lg(ary3)


