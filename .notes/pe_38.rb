####################################################################################################
# Take the number 192 and multiply it by each of 1, 2, and 3:
#
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
#
# By concatenating each product we get the 1 to 9 pandigital, 192384576.
# We will call 192384576 the concatenated product of 192 and (1,2,3)
#
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5,
# giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
#
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
# concatenated product of an integer with (1,2, ... , n) where n > 1?
####################################################################################################

@perms = []
res = []
@starting_length = 9
@final_res
@done = false
def get_subsets(arr, res)
  arr = arr || [1,2,3,4]
  if arr.length == 1
    checker = (res + arr).join('').to_i
    @perms << res + arr if checker > 918273645 # let's not mess with smaller numbers. we know that 918273645 is valid
    return
  end
  arr.each do |num|
    get_subsets(arr - [num], res + [num])
  end
end

get_subsets([9,8,7,6,5,4,3,2,1],res)

[9,1,8,2,7,3,6,4,5]

