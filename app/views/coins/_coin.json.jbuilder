json.extract! coin, :id, :currency_id, :name, :symbol, :created_at, :updated_at
json.url coin_url(coin, format: :json)