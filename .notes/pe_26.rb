####################################################################################################
# Problem 26
# Reciprocal cycles
#
# A unit fraction contains 1 in the numerator. The decimal representation of the
# unit fractions with denominators 2 to 10 are given:
#
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
#
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
# seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.
####################################################################################################

require 'bigdecimal'

def long_div(n,d)
  @num, @den = n, d
  res = ""
  while not_done?(res) do
    res += find_next
  end

end

def find_next(n,d)

end

def not_done?(res)
  tmp = res.match(/(.+)\1+/)[1]
  puts tmp
  p = tmp ? tmp : nil
  return false unless p
  p = not_done?(p)
end




     0.0 1 6 9 X
59 | 1
     1 0
     -----
     1 0 0
       5 9
     -------
       4 1 0
       3 5 4
       -------
         5 6 0
         5 3 1
         -------
           2 9 0

