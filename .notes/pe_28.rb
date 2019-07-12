####################################################################################################
# Problem 28
# Number spiral diagonals
#
# Starting with the number 1 and moving to the r in a clockwise direction a
# 5 by 5 spiral is formed as follows:
#
#        43 44 45 46 47 48 49
#        42 21 22 23 24 25 26       21 22 23 24 25 26
#        41 20  7  8  9 10 27       20  7  8  9 10 27
#        40 19  6  1  2 11 28       19  6  1  2 11 28
#        39 18  5  4  3 12 29       18  5  4  3 12 29
#        38 17 16 15 14 13 30       17 16 15 14 13 30
#        37 36 35 34 33 32 31       36 35 34 33 32 31
#

spiral = [
  [43, 44, 45, 46, 47, 48, 49],
  [42, 21, 22, 23, 24, 25, 26],
  [41, 20,  7,  8,  9, 10, 27],
  [40, 19,  6,  1,  2, 11, 28],
  [39, 18,  5,  4,  3, 12, 29],
  [38, 17, 16, 15, 14, 13, 30],
  [37, 36, 35, 34, 33, 32, 31],
]

cur = 0
res = 0
if n%2 == 0
  skipper = 1
else
  skipper = 2
end

ary = *(1..n**2)

while ary[cur + 1]
  (0..3).each do |step|
    puts ary[cur]
    res += ary[cur]
    cur+= skipper
  end
  skipper += 2
end
puts ary.last
res += ary[cur]

#.................................. 0  -
#............1  O                   1  O
#            2  X                   2  O
#            3  O                   3  O
#            4  X...................4  O
#            5  O                   5  X
#            6  X                   6  X
#            7  O                   7  O
#            8  X                   8  X
#............9  O                   9  X
#            10 X                   10 O
#            11 X                   11 X
#            12 X                   12 X
#            13 O                   13 O
#            14 X                   14 X
#            15 X                   15 X
#            16 X...................16 O
#            17 O                   17 X
#            18 X                   18 X
#            19 X                   19 X
#            20 X                   20 X
#            21 O                   21 O
#            22 X                   22 X
#            23 X                   23 X
#            24 X                   24 X
#............25 O                   25 X
#            26 X                   26 O
#            27 X                   27 X
#            28 X                   28 X
#            29 X                   29 X
#            30 X                   30 X
#            31 O                   31 O
#            32 X                   32 X
#            33 X                   33 X
#            34 X                   34 X
#            35 X                   35 X
#            36 X...................36 0
#            37 O
#            38 X
#            39 X
#            40 X
#            41 X
#            42 X
#            43 O
#            44 X
#            45 X
#            46 X
#            47 X
#            48 X
#............49 O

# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed
# in the same way?
####################################################################################################



def generate_spiral(n)
end

spiral = Array.new(5, Array.new(5))


step_order = [r, d, l, u]

step_order = ['r', 'd', 'l', 'u']


[ r,
  d,
  l, l,
  u, u,
  r, r, r,
  d, d, d,
  l, l, l, l,
  u, u, u, u,
  r, r, r, r, r,
  d, d, d, d, d,
  l, l, l, l, l, l,
  u, u, u, u, u, u,
  r, r, r, r, r, r, r,
]



u = [-1, 0]
r = [0, 1]
l = [0, -1]
d = [1, 0]

def cycle(n)
  if n%2 == 0

  else

  end



  (1..4).each do |step|

  end
end


def can_go?(direction)

end

step_order = [r, d, l, u]
step_order_strings = ['r', 'd', 'l', 'u']
step_order_hsh = { r: r, d: d, l: l, u: u }

n = 5
@spiral = Array.new(n, Array.new(n))
cur_dir_ind = 0
cur = Array.new(2, n/2)

(1..n**2).each_with_index do |num, i|
  @spiral[cur[0]][cur[1]] = num
  cur = get_next_dir(cur)
end


def get_next_dir(cur)
  puts @spiral[cur[0]][cur[1]]
end

next_step = Proc.new { |n| puts "#{n}: #{direction}" }

