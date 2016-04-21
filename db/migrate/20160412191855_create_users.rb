class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :contactNumber
      t.string :streeAddress
      t.string :city
      t.string :province
      t.string :postalCode
      t.string :country
      t.integer :userId

      t.timestamps null: false
    end
  end
end
