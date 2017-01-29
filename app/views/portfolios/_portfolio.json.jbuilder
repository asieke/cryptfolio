json.extract! portfolio, :id, :name, :description, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)