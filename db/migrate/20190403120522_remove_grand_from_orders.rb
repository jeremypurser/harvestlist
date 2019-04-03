class RemoveGrandFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :grand_total_decimal, :string
  end
end
