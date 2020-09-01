####################################################################################################
# Problem 21
# Amicable numbers
#
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n).
#
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
# each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are :
#      1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
# therefore d(220) = 284.
#
# The proper divisors of 284 are:
#      1, 2, 4, 71 and 142;
# so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.
####################################################################################################
require 'set'
def d(n)
  (1...n).select{ |divisor| n%divisor == 0  }.sum
end

def is_amicable?(n)
  d_n = d(n)
  if d(n) != n && d(d_n) == n
     d_n
  else
    nil
  end
end

def am_nums(u_lim)
  keepers = Set.new
  nums = *(1...u_lim)
  nums.each do |num|
    am_num = is_amicable?(num)
    if am_num
      keepers << am_num
      keepers << num
    end
  end
  keepers
end
