class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :authorId
      t.string :category
      t.string :description
      t.float :price
      t.string :publishedDate
      t.string :status
      t.string :condition
      t.binary :cover
      t.binary :book

      t.timestamps null: false
    end
  end
end
