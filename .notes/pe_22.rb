####################################################################################################
# Problem 22
# Names scores
#
# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into
# alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to obtain a name
# score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
# obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?
####################################################################################################

def name_score(name)
  name.split.map(&:bytes).flatten.map{ |val| val - 64}.sum
end

file_name = ".notes/p022_names.txt"
name_arr = ['']
IO.foreach(file_name) do |names|
  name_arr << names.gsub('"', '').split(',')
end
name_arr.flatten!.sort!
name_arr.each_with_index do |name, i|
  puts name_arr[i]
  name_arr[i] = name_score(name) * i
end
name_arr.sum

