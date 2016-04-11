class CombinePricesInLineItems < ActiveRecord::Migration
  def up
    LineItem.all.each do |line|
      p = Product.find_by_id(line.product_id)
      if p
        line.price = p.price
        line.save
      end
      p = nil
    end
  end
end
