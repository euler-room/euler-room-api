####################################################################################################
# Problem 32
# Pandigital products
#
# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through
# 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity can
# be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.
####################################################################################################


digits = Array.new(9, ["1", "2", "3", "4", "5", "6", "7", "8", "9"])

digits.each do |d|
  digits_dup = digits.dup

end

 [      1,         2,        3,        4       ]
        /          |         |          \
       /           |         |           \
      /            |         |            \
     /             |         |             \
 [2,3,4]       [1,3,4]       [1,2,4]       [1,2,3]


require 'set'
require 'awesome_print'

@products = Set.new
@products_arr = []
@perms = []
res = []


def get_subsets(arr, res)
  arr = arr || [1,2,3,4]
  if arr.length == 1
    @perms << res + arr
    return
  end
  arr.each do |num|
    get_subsets(arr - [num], res + [num])
  end
end

def test_perm(perm)
  m0 = ["#{perm[0]}".to_i, "#{perm[1]}#{perm[2]}#{perm[3]}#{perm[4]}".to_i, "#{perm[5]}#{perm[6]}#{perm[7]}#{perm[8]}".to_i]
  @products << m0[2] if m0[0]*m0[1]==m0[2]
  @products_arr << m0[2] if m0[0]*m0[1]==m0[2]

  m1 = ["#{perm[0]}#{perm[1]}".to_i, "#{perm[2]}#{perm[3]}#{perm[4]}".to_i, "#{perm[5]}#{perm[6]}#{perm[7]}#{perm[8]}".to_i]
  @products << m1[2] if m1[0]*m1[1]==m1[2]
  @products_arr << m1[2] if m1[0]*m1[1]==m1[2]

  m2 = ["#{perm[0]}#{perm[1]}#{perm[2]}".to_i, "#{perm[3]}#{perm[4]}".to_i, "#{perm[5]}#{perm[6]}#{perm[7]}#{perm[8]}".to_i]
  @products << m2[2] if m2[0]*m2[1]==m2[2]
  @products_arr << m2[2] if m2[0]*m2[1]==m2[2]

  m3 = ["#{perm[0]}#{perm[1]}#{perm[2]}#{perm[3]}".to_i, "#{perm[4]}".to_i, "#{perm[5]}#{perm[6]}#{perm[7]}#{perm[8]}".to_i]
  @products << m3[2] if m3[0]*m3[1]==m3[2]
  @products_arr << m3[2] if m3[0]*m3[1]==m3[2]

  nil;
end

get_subsets([1,2,3,4,5,6,7,8,9], res)
@perms.each do |perm|
  test_perm(perm)
  nil;
end



[3,9,1,8,6,7,2,5,4]
9*8


1
2
6
24
120
720
5040
40320
362880








2 1 3
2 3 1

3 1 2
3 2 1


1 2 3 4
1 2 4 3
1 3 2 4
1 3 4 2
1 4 2 3
1 4 3 2

2 1 3 4
2 1 4 3
2 3 1 4
2 3 4 1
2 4 3 1
2 2 1 3

3 1 2 4
3 1 4 2
3 2 1 4
3 2 4 1
3 4 1 2
3 4 2 1

4 1 2 3
4 1 3 2
4 2 1 3
4 2 3 1
4 3 1 2
4 3 2 1
