#!/usr/bin/env ruby
def verse(count)
  if count > 0
    puts "#{count} bottles of beer on the wall, #{count} bottles of beer.
Take one down and pass it around, #{count - 1} bottles of beer on the wall."
    puts ''
    verse(count - 1)
  else
    puts 'No bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.'
  end
end

verse(99)
