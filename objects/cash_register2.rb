#!/usr/bin/env ruby
class CashRegister
  def initialize
    @total = 0.00
  end

  def purchase(price)
    @total += price
    total
  end

  def pay(value)
    @total -= value
    if @total < 0
      change = -@total
      @total = 0.0
      "Your change is $#{sprintf('%.2f', change)}"
    else
      "Your new total is $#{total}"
    end
  end

  def total
    sprintf('%.2f', @total)
  end
end

register = CashRegister.new
puts register.total  # => 0.00
puts register.purchase(3.78)  	# => 3.78
puts register.purchase(5.22)	# => 9.00
puts register.total  			# => 9.00
puts register.pay(5.00)  # => "Your new total is $4.00"
puts register.total			# => 4.00
puts register.pay(5.00)  # => "Your change is $1.00"
puts register.total # => 0.00
