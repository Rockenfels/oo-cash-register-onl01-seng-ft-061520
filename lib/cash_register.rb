require 'pry'

class CashRegister
  
  attr_accessor :discount, :total, :items
  
  
  def initialize(discount=nil)
      @total = 0
      @discount = discount
      @items = []
  end
  
  def add_item(title, price, quantity=1)
     @total += price * quantity
     added = 0
     until added == quantity
       @items << title
     end
  end
  
  def apply_discount
    if @discount
       discount_multiplier = @discount.to_f
       discount_multiplier /= 100
       discount = (@total * discount_multiplier).to_int
       @total -= discount
       return "After the discount, the total comes to $#{@total}."
    else
       return "There is no discount to apply."
    end
  end
  
end
