json.extract! product, :id, :name, :photo, :quantity, :price, :description, :created_at, :updated_at
json.url product_url(product, format: :json)