# coding: utf-8

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def palindrome?(number)
  str = number.to_s
  n = str.size / 2
  str[0...n] == str[n..-1].reverse
end

def largest_palindrome?(current_largest, candidate)
  candidate > current_largest && palindrome?(candidate)
end

def find_largest(member_candidates)
  member_candidates.product(member_candidates).inject(0) { |max, pair|
    product = pair[0] * pair[1]
    largest_palindrome?(max, product) ? product : max
  }
end

p find_largest (100..1000).to_a
