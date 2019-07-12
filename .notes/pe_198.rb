####################################################################################################
# Problem 198
# Ambiguous Numbers
#
# A best approximation to a real number x for the denominator bound d is a rational
# number r/s (in reduced form) with s ≤ d, so that any rational number p/q which is
# closer to x than r/s has q > d.
#
# Usually the best approximation to a real number is uniquely determined for all
# denominator bounds. However, there are some exceptions, e.g. 9/40 has the two
# best approximations 1/4 and 1/5 for the denominator bound 6. We shall call a
# real number x ambiguous, if there is at least one denominator bound for which x
# possesses two best approximations. Clearly, an ambiguous number is necessarily
# rational.
#
# How many ambiguous numbers x = p/q, 0 < x < 1/100, are there whose denominator q
# does not exceed 10^8?
####################################################################################################

def med(l, r)
  ((l[0].to_f/l[1].to_f) + (r[0].to_f/r[1].to_f)) / 2
end

requiire 'set'
def f_seq(d)
  seq = Set.new
  (0..d).to_a.each do |n|
    seq << n/d.to_r
    puts n if n%1000 == 0
  end
  seq
end

def value(pair)
  pair[0]/pair[1]
end



n=1 : 0/1 : 1/1
n=2 : 0/1 : 1/2 : 1/1
n=3 : 0/1 : 1/4 : 1/2 : 1/1
n=4 : 0/1 :     : 1/4 :     : 1/1
.
.
.
n=10 : 0/10 : 1/10 : 2/10 : 3/10 : 4/10 : 5/10 : 6/10 : 7/10 : 8/10 : 9/10 : 10/10



5899000
