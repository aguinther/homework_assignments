#!/usr/bin/env ruby
vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts vals.join('...') + '...'
puts "T-#{vals.reverse.join(', ')}...  BLASTOFF!"
puts "The last element is #{vals.last}"
puts "The first element is #{vals.first}"
puts "The third element is #{vals[2]}"
puts "The element with an index of 3 is #{vals[3]}"
puts "The second from last element is #{vals[-2]}"
puts "The first four elements are '#{vals[0..3].join(', ')}'"
puts "If we delete #{vals.delete(5)}, #{vals.delete(6)}, and " \
  "#{vals.delete(7)} from the array, we're left with [#{vals.join(',')}]"
puts "If we add #{vals.unshift(5)} at the beginning of the array, " \
"we are left with [#{vals.join(',')}]"
puts "If we add #{vals.push(6)} at the end of the array, we're left " \
  "with [#{vals.join(',')}]"
puts "Only the elements #{vals.delete_if { |x | x <= 8 }} are > 8"
puts 'If we remove all the elements, ' \
  "then the length of the array is #{vals.clear.length}"
