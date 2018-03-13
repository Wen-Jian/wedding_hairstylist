class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|

    	t.integer :customer_id
    	t.integer :seller_id
    	t.integer :price
    	t.text :service_des
     	t.timestamps
    end

    add_index :orders, :customer_id
    add_index :orders, :seller_id
    add_column :users, :order_id, :integer
    add_index :users, :order_id
  end
end
