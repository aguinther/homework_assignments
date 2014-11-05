#!/usr/bin/env ruby
def verse(count)
  if count > 2
    plural1 = 's'
    plural2 = 's'
  elsif count == 2
    plural1 = 's'
    plural2 = ''
  else
    plural1 = ''
    plural2 = 's'
  end

  if count == 1
    nextval = 'no more'
  else
    nextval = count - 1
  end

  if count > 0
    puts "#{count} bottle#{plural1} of beer on the wall, #{count} bottle#{plural1} of beer.
Take one down and pass it around, #{nextval} bottle#{plural2} of beer on the wall."
    puts ''
    verse(count - 1)
  else
    puts 'No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.'
  end
end

verse(99)
