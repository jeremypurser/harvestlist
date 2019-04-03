class AddItemsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :subtotal, :decimal
    add_column :orders, :sales_tax, :decimal
    add_column :orders, :grand_total_decimal, :string
  end
end
