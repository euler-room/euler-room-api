####################################################################################################
# Problem 31
# Coin sums
#
# In England the currency is made up of pound, £, and pence, p, and there are
# eight coins in general circulation:
#
#     1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# It is possible to make £2 in the following way:
#
#     1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
#
# How many different ways can £2 be made using any number of coins?
####################################################################################################

coins = [200, 100, 50, 20, 10, 5, 2, 1]
goal = 200

range = *(1..200)


@orig_amount = 1.72
denominations = [1.00, 0.25, 0.05 ,0.10, 0.01]

def get_d_count(amt, denomination)
  count = amt / denomination
  count
end

@res = []

def make_change(amount, denominations)
  int_denominations = denominations.map{ |d| (d*100).to_i }
  amount = (amount * 100).to_i
  int_denominations.sort.reverse.each do |d|
    d_count = get_d_count(amount, d)
    puts d_count
    amount = amount - d_count*d
    d_parsed = d/100.0
    @res << "#{d_count}x#{d}" if d_count > 0
  end
  return {"$#{@orig_amount}": @res }
end

print make_change(@orig_amount, denominations)
