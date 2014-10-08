#!/usr/bin/env ruby

str = 'this is a string to practice with'
puts str
puts str.capitalize
puts str.upcase
puts str.gsub('string', "'string'")
puts "The string #{str} has #{str.length} characters"
puts str.reverse
string = ((str.split(' ')[-2] + ' ') * 3).strip
puts string + '!'
