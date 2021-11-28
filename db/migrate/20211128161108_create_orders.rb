class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :payment_method
      t.string :postage
      t.string :order_price
      t.integer :is_active

      t.timestamps
    end
  end
end
