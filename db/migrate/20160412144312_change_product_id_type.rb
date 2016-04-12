class ChangeProductIdType < ActiveRecord::Migration
  def up 
    change_column :line_items, :product_id, :integer
  end

  def down
    change_column :line_items, :product_id, :string
  end
end
