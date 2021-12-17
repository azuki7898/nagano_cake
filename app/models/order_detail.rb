class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item
  

  enum making_status: {"no_manufactured": 0, "wait_production": 1, "production": 2, "complited": 3}

end