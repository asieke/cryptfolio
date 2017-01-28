class Coin < ApplicationRecord

	def coinmarketcaplink
		return "https://coinmarketcap.com/currencies/" + currency_id
	end
end
