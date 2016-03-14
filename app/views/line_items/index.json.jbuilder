json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :product_id, :integer, :cart_id, :integer
  json.url line_item_url(line_item, format: :json)
end
