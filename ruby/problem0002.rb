# coding: utf-8
fib = Enumerator.new do |y|
  a, b = 1, 2 # initialize
  loop do 
    y << a
    a, b = b, a + b
  end
end

p fib.lazy.select(&:even?).take_while { |n| n <= 4000000 }.reduce(&:+)
