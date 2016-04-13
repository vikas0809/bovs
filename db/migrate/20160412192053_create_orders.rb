class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :userId
      t.integer :bookId
      t.integer :quantity
      t.float :price
      t.float :tax
      t.float :totalAmount

      t.timestamps null: false
    end
  end
end
