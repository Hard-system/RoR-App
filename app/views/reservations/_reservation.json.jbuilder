json.extract! reservation, :id, :customer_id, :cruise_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
