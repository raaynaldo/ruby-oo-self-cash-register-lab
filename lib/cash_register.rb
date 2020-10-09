class CashRegister
  attr_reader :discount, :total, :items
  attr_writer :total

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @last_transcation = 0
    @items = []
  end

  def add_item(title, price, qty = 1)
    @last_transcation = price * qty
    self.total += @last_transcation
    qty.times { @items << title }
  end

  def apply_discount
    if (@discount != 0)
      self.total = self.total * (100 - @discount) / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transcation
  end
end
