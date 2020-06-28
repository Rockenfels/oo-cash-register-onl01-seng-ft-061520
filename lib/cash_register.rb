require 'pry'

class CashRegister
  
  attr_accessor :discount, :total
  
  
  def initialize(discount=nil)
      @total = 0.to_f
      @discount = discount
      @items = []
  end
  
  def add_item(title, price, quantity=1)
     @total += price * quantity
     added = 0
     until added == quantity
       @items << [title, price]
       added += 1
     end
  end
  
  def apply_discount
    if @discount
       discount_multiplier = @discount.to_f
       discount_multiplier /= 100
       discount = (@total * discount_multiplier)
       @total -= discount
       return "After the discount, the total comes to $#{@total.to_int}."
    else
       return "There is no discount to apply."
    end
  end
  
  def items 
    pulls = []
    @items.each do |item|
      pulls << item[0]
    end
    pulls
  end
  
  def void_last_transaction
    item = @items.pop
    price = item[1]
    @total -= price
  end
end
