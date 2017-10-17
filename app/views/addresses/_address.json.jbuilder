json.extract! address, :id, :street, :city, :postcode, :customer_id, :created_at, :updated_at
json.url address_url(address, format: :json)
