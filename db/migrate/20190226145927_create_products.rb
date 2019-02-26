class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :unit
      t.integer :quantity
      t.text :description
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
