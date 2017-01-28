class Coin < ApplicationRecord
	has_many :prices

	def coinmarketcaplink
		return "https://coinmarketcap.com/currencies/" + currency_id
	end
end
