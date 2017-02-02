class Coin < ApplicationRecord
	validates_uniqueness_of :currency_id
	has_many :prices

	def coinmarketcaplink
		return "https://coinmarketcap.com/currencies/" + currency_id
	end

	def current_price
		# puts "=======\n"
		# puts id
		# puts "========\n"

		# p1 = Price.where(["coin_id = ?", self.id]).order("query_time DESC").first
		# return p1.price_usd

		return "hello"
	end
end
