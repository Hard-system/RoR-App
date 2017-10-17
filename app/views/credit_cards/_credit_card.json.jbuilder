json.extract! credit_card, :id, :number, :exp_date, :name_on_card, :organisation, :customer_id, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
