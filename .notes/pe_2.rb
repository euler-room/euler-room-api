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
sum


4613732
