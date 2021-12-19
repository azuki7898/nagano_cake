class Order < ApplicationRecord

  belongs_to :admin, optional: true
  has_many :order_details
  belongs_to :customer



  enum payment_method: {"credit_card": 0, "bank_transfer": 1}
  enum is_active: {"not_payment": 0, "deposited": 1, "production": 2, "waiting": 3, "complited": 4}
end
