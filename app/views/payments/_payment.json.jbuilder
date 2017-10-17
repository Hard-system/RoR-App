json.extract! payment, :id, :amount, :card_number, :customer_id, :reservation_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
