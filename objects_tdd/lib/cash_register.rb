class CashRegister
  def initialize
    @total = 0
  end

  def total
    sprintf('%.2f', @total)
  end

  def purchase(amount)
    if amount > 0
      @total += amount
    elsif amount < 0
      'Negative purchase not allowed'
    end
  end

  def pay(amount)
    if amount < 0
      'Payment must be positive'
    else
      if amount <= @total
        @total -= amount
        "Your new total is $#{total}"
      elsif amount > @total
        change = amount - @total
        @total = 0
        "Your change is $#{sprintf('%.2f', change)}"
      end
    end
  end
end
