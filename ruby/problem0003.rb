# coding: utf-8

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def find_min_prime_factor (n)
  # Find the minimum prime factor from 2 to √n.
  # If no element does, return nil.
  limit = Integer Math.sqrt(n)
  2.upto(limit).lazy.select { |i| (n % i).zero? }.first()
end

def find_max_prime_factor (n)
  # Find the maximum prime factor.
  # If the minimum prime factor is found,
  # call recursively with the value devided by the factor.
  # If it's not found, return the argument.
  minFactor = find_min_prime_factor(n)
  if minFactor.nil? then n else find_max_prime_factor(n / minFactor) end
end

p find_max_prime_factor(600851475143)
