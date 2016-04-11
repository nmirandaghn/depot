class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates :price, numericality: { greater_than_or_equal_to: 0.01}
  
  def total_price
    price * quantity
  end
end
