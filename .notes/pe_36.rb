###################################################################################################
# Problem 36
# Double-base palindromes
#
# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in
# base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include
# leading zeros.)
###################################################################################################

def is_palindrome(num)
  num.to_s == num.to_s.reverse
end

a = (1...1000000).to_a
a.select!{ |num| is_palindrome num }

a.select!{ |num| is_palindrome("%b" % num) }

a: [1, 3, 5, 7, 9, 33, 99, 313, 585, 717, 7447, 9009, 15351, 32223, 39993, 53235, 53835, 73737, 585585]

