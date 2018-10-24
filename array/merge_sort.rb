
def ary_merge_sort(ary)
	if ary.size == 0 || ary.size == 1
		return ary
	end

	rs = ary_split(ary)
	p rs
	sleep 1
	x = ary_merge_sort(rs['a'])
	y = ary_merge_sort(rs['b'])

	return ary_merge(x,y)
end

def ary_split(ary)
	total = ary.size 
	size = (ary.size/2).to_i

	return {
		'a'  => ary.first(size),
		'b'  => ary.last(total - size)
	}
end

def ary_merge(a,b)
	if a.size == 0
		return b
	end

	if b.size == 0
		return a
	end

	if a[0] < b[0]
		return [a[0], ary_merge(a[1..-1], b)].flatten
	end

	return [b[0], ary_merge(a, b[1..-1])].flatten
end


p ary_merge_sort([1,2,8,9,3,4,0,5,6])
