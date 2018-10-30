#https://www.geeksforgeeks.org/swap-all-odd-and-even-bits/
#Swap all odd and even bits
#Given an unsigned integer, swap all odd bits with even bits. For example, if the given number is 23 (00010111), it should be converted to 43 (00101011). Every even position bit is swapped with adjacent bit on right side (even position bits are highlighted in binary representation of 23), and every odd position bit is swapped with adjacent on left side.

# 1010 1010 1010 1010 1010 1010 1010 1010 0xAAAAAAAA
# 0101 0101 0101 0101 0101 0101 0101 0101 0x55555555



#00010111
#00101011

def swap(x)
	 p x.to_s(2)
	 even_bits = x & 0xAAAAAAAA  
	 p even_bits.to_s(2)
	   
	 odd_bits = x & 0x55555555
	 p odd_bits.to_s(2)

	 even_bits >>= 1;  # Right shift even bits 
	 odd_bits <<= 1;   # Left shift odd bits 

	 p '---'
	 p even_bits.to_s(2)
	 p odd_bits.to_s(2)
	 p '==='

	 r = (even_bits | odd_bits) 

	 p r.to_s(2)
	p "\n"

end

swap(23)
swap(9)
#1001   
#1*0* - *1*0
#*0*1 - 0*10
#       0110   

#	"10111"
#	"10"
#	"10101"
#	"---"
#	"1"
#	"101010"
#	"==="
#	"101011"

