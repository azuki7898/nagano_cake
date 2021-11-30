class Order < ApplicationRecord
  
  belongs_to :admin
  has_many :order_details
end
