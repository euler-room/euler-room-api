####################################################################################################
# Problem 33
# Digit cancelling fractions
#
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in
# attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is
# correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less than
# one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find
# the value of the denominator.
####################################################################################################
def is_candidate?(d,q)
  d != q &&
  d.join("").to_f / q.join("").to_f < 1 &&
  d.join("").to_i % 10 != 0 &&
  q.join("").to_i % 10 != 0 &&
  (d - q).length > 0 &&
  (q.include?(d[0]) || q.include?(d[1]))
end

ds = *('10'..'99')
ds.map!{|d| d.split("") if d.split("")[0] != d.split("")[1] }.compact!
qs = ds.dup
candidates = []
ds.each do |d|
  qs.each do |q|
    candidates << [d,q] if is_candidate?(d,q)
  end
end

res = candidates.select do |c|
  n0 = c[0].join("")
  n1 = c[1].join("")
  c0 = (c[0] - c[1])[0]
  c1 = (c[1] - c[0])[0]

  (n0.to_f / n1.to_f) == (c0.to_f / c1.to_f)
end;nil


r0 = Rational(16 , 64)
r1 = Rational(19 , 95)
r2 = Rational(26 , 65)
r3 = Rational(49 , 98)

r0 * r1 * r2 * r3
