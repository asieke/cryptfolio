class Coin < ApplicationRecord
	validates_uniqueness_of :currency_id
	has_many :prices

	def coinmarketcaplink
		return "https://coinmarketcap.com/currencies/" + currency_id
	end
end
