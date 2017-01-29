json.extract! transaction, :id, :coin_id, :date, :amount, :price_usd, :price_btc, :kind, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)