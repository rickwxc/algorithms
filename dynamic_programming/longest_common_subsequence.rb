#LCS Problem Statement: Given two sequences, find the length of longest subsequence present in both of them. A subsequence is a sequence that appears in the same relative order, but not necessarily contiguous. For example, “abc”, “abg”, “bdf”, “aeg”, ‘”acefg”, .. etc are subsequences of “abcdefg”. So a string of length n has 2^n different possible subsequences.

#It is a classic computer science problem, the basis of diff (a file comparison program that outputs the differences between two files), and has applications in bioinformatics.

#Examples:
#LCS for input Sequences “ABCDGH” and “AEDFHR” is “ADH” of length 3.
#LCS for input Sequences “AGGTAB” and “GXTXAYB” is “GTAB” of length 4.

#1) Optimal Substructure: Let the input sequences be X[0..m-1] and Y[0..n-1] of lengths m and n respectively. And let L(X[0..m-1], Y[0..n-1]) be the length of LCS of the two sequences X and Y. Following is the recursive definition of L(X[0..m-1], Y[0..n-1]).

#If last characters of both sequences match (or X[m-1] == Y[n-1]) then
#L(X[0..m-1], Y[0..n-1]) = 1 + L(X[0..m-2], Y[0..n-2])

#If last characters of both sequences do not match (or X[m-1] != Y[n-1]) then
#L(X[0..m-1], Y[0..n-1]) = MAX ( L(X[0..m-2], Y[0..n-1]), L(X[0..m-1], Y[0..n-2]) )

#Examples:
#1) Consider the input strings “AGGTAB” and “GXTXAYB”. Last characters match for the strings. So length of LCS can be written as:
#L(“AGGTAB”, “GXTXAYB”) = 1 + L(“AGGTA”, “GXTXAY”)
#2) Consider the input strings “ABCDGH” and “AEDFHR. Last characters do not match for the strings. So length of LCS can be written as:
#L(“ABCDGH”, “AEDFHR”) = MAX ( L(“ABCDG”, “AEDFHR”), L(“ABCDGH”, “AEDFH”) )

$depth = 0
def lcs(str1, str2)
	$depth = $depth + 1

	p "#{" " * $depth}#{str1} #{str2}"

	if str1 == '' or str2 == ''
		return ''
	end

	if str1[-1] == str2[-1]
		x = lcs(str1[0..-2], str2[0..-2]) + str2[-1]
		$depth = $depth - 1
		return x
	end

	a =  lcs(str1[0..-2], str2)
	$depth = $depth - 1
	b =  lcs(str1, str2[0..-2])
	$depth = $depth - 1
	if a.size > b.size
		return a
	else
		return b
	end
end


p lcs('AGGTAB', 'GXTXAYB')
p lcs('ABCDGH', 'AEDFHR')
#LCS for input Sequences “ABCDGH” and “AEDFHR” is “ADH” of length 3.
#LCS for input Sequences “AGGTAB” and “GXTXAYB” is “GTAB” of length 4.
