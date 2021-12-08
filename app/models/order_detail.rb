class OrderDetail < ApplicationRecord

  belongs_to :order

  def add_tax_tax_price
    (self.item.price * 1.08).round
  end

end
