Even Fibonacci numbers

i0 = 1
i1 = 1
sum = 0
while true do
  tmp = i0 + i1
  break if tmp > 4_000_000
  sum += tmp if tmp % 2 == 0
  i0 = i1
  i1 = tmp
end
puts sum


4613732



"<p>&nbsp&nbsp&nbsp&nbspEven Fibonacci numbers</p><br/><p>&nbsp&nbsp&nbsp&nbspi0 = 1</p><p>&nbsp&nbsp&nbsp&nbspi1 = 1</p><p>&nbsp&nbsp&nbsp&nbspsum = 0</p><p>&nbsp&nbsp&nbsp&nbspwhile true do</p><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsptmp = i0 + i1</p><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspbreak if tmp > 4_000_000</p><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspsum += tmp if tmp % 2 == 0</p><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspi0 = i1</p><p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspi1 = tmp</p><p>&nbsp&nbsp&nbsp&nbspend</p><p>&nbsp&nbsp&nbsp&nbspputs sum</p>"
