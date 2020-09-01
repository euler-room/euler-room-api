####################################################################################################
# Problem 35
# Circular primes
#
# The number, 197, is called a circular prime because all rotations of the digits:
#   197, 971, and 719
# are themselves prime.
#
# There are thirteen such primes below 100:
#   2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?
####################################################################################################
20190516203124, 20190521191942, 20190521222608, 20190521191942, 20190521190252


n = 250
n = 78498

require 'set'
require 'awesome_print'
require 'prime'

regex = /\d*[02468]/
@primes = Prime.first(n).select{ |prime| !prime.to_s.match(regex) }

@perms = [2]

def get_subsets(arr)
  set = Set.new
  arr.length.times{ set << (arr.push(arr.shift).join.to_i) };nil
  return set.all?(&:prime?) ? set.to_a : nil
end

@primes.each do |prime|
  prime_s = prime.to_s
    a = get_subsets(prime_s.split(''))
    a.each{|x| @perms << x } if a
end

res = Set.new( @perms )
res.count # (55)
