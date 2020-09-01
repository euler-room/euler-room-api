####################################################################################################
# Problem 34
# Digit factorials
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of
# their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
####################################################################################################

def fact(n)
  (1..n).to_a.reduce(:*)
end

def check_num(n)
  n_arr = n.to_s.split("").map(&:to_i)
  puts "#{n_arr}"
  n_arr.reduce{ |n| fact(n) }
end

ns = *(1..1000)
