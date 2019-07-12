####################################################################################################
# GCD sequence
#
# Problem 443
# Let g(n) be a sequence defined as follows:
# g(4) = 13,
# g(n) = g(n-1) + gcd(n, g(n-1)) for n > 4.
#
# The first few values are:
#    n	   4	 5	 6	 7	 8	 9	10	11	12	13	14	15	16	17	18	19	20	...
#    g(n)	13	14	16	17	18	27	28	29	30	31	32	33	34	51	54	55	60	...
#
# You are given:
#    g(1_000)     = 2524
#    g(1_000_000) = 2624152.
#
# Find g(1_000_000_000_000_000).
####################################################################################################
require 'byebug'
require 'awesome_print'

@cache = {n}
def g(n)
  if n == 4
    return 13
  elsif @cache[n]
    return @cache[n]
  end
  g_of_n_minus_1 = g(n-1)
  cur_g = g_of_n_minus_1 + n.gcd(g_of_n_minus_1)
  @cache = {n => cur_g}
  cur_g
end

def g(n)
  cache = 13
  (5..n).to_a.each do |n|
    cache = cache + n.gcd(cache)
  end
  cache
end

limit = 10**15
i2 = 20
while true
  q = 2*i2 - 1
  p = q.gcd()


  break if i2 > limit
  i1 = i2
end
3*i1 + (10^15 - i1)


