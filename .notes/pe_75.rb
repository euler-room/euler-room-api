####################################################################################################
# Problem 75
# Singular integer right triangles
#
# It turns out that 12 cm is the smallest length of wire that can be bent to form
# an integer sided right angle triangle in exactly one way, but there are many
# more examples.
#
# 12 cm: (3,4,5)
# 24 cm: (6,8,10)
# 30 cm: (5,12,13)
# 36 cm: (9,12,15)
# 40 cm: (8,15,17)
# 48 cm: (12,16,20)
#
# In contrast, some lengths of wire, like 20 cm, cannot be bent to form an integer
# sided right angle triangle, and other lengths allow more than one solution to be
# found; for example, using 120 cm it is possible to form exactly three different
# integer sided right angle triangles.
#
# 120 cm: (30,40,50), (20,48,52), (24,45,51)
#
# Given that L is the length of the wire, for how many values of L ≤ 1,500,000 can
# exactly one integer sided right angle triangle be formed?
#
####################################################################################################
#
# Integer triangles with given perimeter
# Any triple of positive integers can serve as the side lengths of an integer
# triangle as long as it satisfies the triangle inequality: the longest side is
# shorter than the sum of the other two sides. Each such triple defines an integer
# triangle that is unique up to congruence. So the number of integer triangles
# (up to congruence) with perimeter p is the number of partitions of p into three
# positive parts that satisfy the triangle inequality. This is the integer closest to:
#
#   ​p2⁄48 when p is even and to ​(p + 3)2⁄48 when p is odd.
#
# It also means that the number of integer triangles with even numbered perimeters
# p = 2n is the same as the number of integer triangles with odd numbered perimeters
# p = 2n − 3. Thus there is no integer triangle with perimeter 1, 2 or 4, one with
# perimeter 3, 5, 6 or 8, and two with perimeter 7 or 10. The sequence of the number
# of integer triangles with perimeter p, starting at p = 1, is:
#
#   0, 0, 1, 0, 1, 1, 2, 1, 3, 2, 4, 3, 5, 4, 7, 5, 8, 7, 10, 8
####################################################################################################
require 'byebug'
ary = Array(12..50)
ary = Array(12..1_500_000);nil
def check_triple(a,b,c)
  a**2 + b**2 == c**2
end

factors = []

ary.reverse.each do |perimeter|
  puts "PERIMETER: #{perimeter}"
  found_triple = false
  factors_a = Array(1..perimeter/2);nil
  factors_a.each do |fa|
    factors_b = factors_a.select{ |num| num > fa };nil
    factors_b.each do |fb|
      (factors_b - [fb]). do |fc|
        fc < fa + fb && fa+fb+fc == perimeter && fc > fa && fc > fb
      end
    end
  end
end
