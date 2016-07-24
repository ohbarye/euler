# coding: utf-8

# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
#  1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
#  10: 1,2,5,10
#  15: 1,3,5,15
#  21: 1,3,7,21
#  28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.
#
# What is the value of the first triangle number to have over five hundred divisors?

require 'prime'

seq = Enumerator.new do |y|
  a, b = 1, 2 # initialize
  loop do 
    y << a
    a, b = a + b, b + 1
  end
end

class Integer
  def divisors
    ar = [1] + (self.prime_division.flat_map {|a, b| (1..b).map {a} })
    (1..ar.size).flat_map {|i| ar.combination(i).map {|c| c.inject(:*)} }.uniq
  end
end

p seq.lazy.select {|n| n.divisors.count > 500 }.first
