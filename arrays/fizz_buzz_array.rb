#!/usr/bin/env ruby

numbers = (1..100)
fizzbuzz = []

numbers.each do |num|
  if num % 3 == 0 && num % 5 == 0
    fizzbuzz.push('FizzBuzz')
  elsif num % 3 == 0
    fizzbuzz.push('Fizz')
  elsif num % 5 == 0
    fizzbuzz.push('Buzz')
  else
    fizzbuzz.push(num)
  end
end

puts fizzbuzz
