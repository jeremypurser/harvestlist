json.extract! product, :id, :name, :price, :unit, :quantity, :description, :category_id, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
