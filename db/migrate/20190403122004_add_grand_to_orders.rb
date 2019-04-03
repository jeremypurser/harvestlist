class AddGrandToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :grand_total, :string
    add_column :orders, :decimal, :string
  end
end
