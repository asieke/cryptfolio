# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

Price.delete_all
Transaction.delete_all
Portfolio.delete_all
Coin.delete_all
Btcusd.delete_all

price_tsv= "https://docs.google.com/spreadsheets/d/1udBI92bYU-3rYelSuhv0AY3KT0dQqIQjGx42Z1BKU8k/pub?gid=1607858933&single=true&output=tsv"
coin_tsv = "https://docs.google.com/spreadsheets/d/1udBI92bYU-3rYelSuhv0AY3KT0dQqIQjGx42Z1BKU8k/pub?gid=789482907&single=true&output=tsv"
port_tsv = "https://docs.google.com/spreadsheets/d/1udBI92bYU-3rYelSuhv0AY3KT0dQqIQjGx42Z1BKU8k/pub?gid=1957918172&single=true&output=tsv"
txn_tsv  = "https://docs.google.com/spreadsheets/d/1udBI92bYU-3rYelSuhv0AY3KT0dQqIQjGx42Z1BKU8k/pub?gid=1188600026&single=true&output=tsv"
btc_tsv  = "https://docs.google.com/spreadsheets/d/1udBI92bYU-3rYelSuhv0AY3KT0dQqIQjGx42Z1BKU8k/pub?gid=0&single=true&output=tsv"

#######################
# Create Coins
########################
puts "1. CREATING COINS....\n"

open(coin_tsv).drop(1).each do |line|;
	arr = line.split("\t")
	Coin.create({
		currency_id: arr[2],
		name: arr[1],
		symbol: arr[0]
	});
end

#######################
# Create Prices
########################
puts "2. CREATING PRICE TABLE....\n"


open(price_tsv).drop(1).each do |line|;
	row = line.split("\t")
	coin_id = Coin.where(symbol: row[1]).first.id
	Price.create({
		query_time: row[0][0,10],
		coin_id: coin_id,
		rank: row[7],
		price_usd: row[2],
		price_btc: row[3],
		volume_usd: row[6],
		market_cap_usd: row[4],
		available_supply: row[5],
		total_supply: row[8]
	})
end


# #######################
# # Create Portfolio
# ########################
puts "3. CREATING PORTFOLIOS....\n"
open(port_tsv).drop(1).each do |line|;
	row = line.split("\t")
	Portfolio.create({
		name: row[0].squish,
		description: row[1].squish
	})
end


# #######################
# # Create Seed TXN
# ########################
puts "4. CREATING SEED TXN....\n"
#0 - date	1 - symbol	2 - portfolio	3 - amount	4 - price_usd	5 - price_btc	6 - kind

open(txn_tsv).drop(1).each do |line|;
	row = line.split("\t")
	coin_id = Coin.where(symbol: row[1]).first.id
	portfolio_id = Portfolio.where(name: row[2]).first.id
	Transaction.create({
		 coin_id: coin_id,
		 portfolio_id: portfolio_id,
		 date: row[0],
		 amount: row[3],
		 price_usd: row[4],
		 price_btc: row[5],
		 kind: row[6].squish
	})

end


# #######################
# # Historical BTC Prices
# ########################

puts "5. Creating Historical BTC Price DB\n"
#0 - date	1 - symbol	2 - portfolio	3 - amount	4 - price_usd	5 - price_btc	6 - kind

open(btc_tsv).drop(1).each do |line|;
	row = line.split("\t")

	Btcusd.create({
		date: row[0][0,10],
		price_usd: row[1].squish
	})

end



# # Btcusd.create()