# coding: utf-8

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

p [*1...1000].combination(2).map {|c| [*c, (Math.sqrt(c[0]**2 + c[1]**2))] }.find {|c| c.inject(:+) == 1000 }.inject(:*).to_i

