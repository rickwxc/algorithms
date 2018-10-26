# my whole career begin with this interview question.
# Thanks to M & P

def is_power_of_2(x)
	a = x
	b = (x-1)
	r = a & b

	p a.to_s(2)
	p b.to_s(2)
	p r
	return r == 0
end

p is_power_of_2(8)
p is_power_of_2(7)
