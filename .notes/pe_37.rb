####################################################################################################
# Problem 37
# Truncatable primes
#
# The number 3797 has an interesting property. Being prime itself, it is possible
# to continuously remove digits from left to right, and remain prime at each stage:
#   3797, 797, 97, and 7.
# Similarly we can work from right to left:
#   3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from left to
# right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
#
####################################################################################################

def check(prime)
  pa = prime.to_s.split("")
  primes = [prime]

  (0...pa.length - 1).to_a.each do |p|
    p = p+1
    primes <<  pa[0, p].join("").to_s.to_i
    primes <<  pa[-p, p].join("").to_s.to_i
  end

  primes.all?{ |p| p.prime? }
end

a = []
(Prime.first(100000) - [2,3,5,7]).each do |p|
  a << p if check(p)
end;nil
puts a.sum
