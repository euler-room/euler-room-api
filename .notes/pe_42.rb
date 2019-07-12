####################################################################################################
# Problem 42
# Coded triangle numbers
#
# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1);
# so the first ten triangle numbers are:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# By converting each letter in a word to a number corresponding to its alphabetical
# position and adding these values we form a word value. For example, the word value
# for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we
# shall call the word a triangle word.
#
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
# containing nearly two-thousand common English words, how many are triangle words?
####################################################################################################

test = "SKY"
def get_word_value(word)
  word_value = 0
  word.each_byte{ |ascii| word_value += (ascii - 64)}
  word_value
end

def is_triangular?(word)
  num = get_word_value(word)
  n = 0
  failing = true
  while failing
    n += 1
    tri_val = n_triangle(n)
    pass = num == tri_val
    failing = !pass && tri_val < num
  end
  pass
end

def n_triangle(n)
  (n * (n+1))/2
end

file_name = ".notes/p042_words.txt"
word_arr = []
IO.foreach(file_name) do |words|
  word_arr << words.gsub('"', '').split(',')
end
count = 0
word_arr.flatten!.each{ |word| count += 1 if is_triangular?(word) }
