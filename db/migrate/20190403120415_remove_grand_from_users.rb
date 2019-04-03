class RemoveGrandFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :grand_total_decimal, :string
  end
end
