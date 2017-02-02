desc "This task is called by the Heroku scheduler add-on"




task :update_prices => :environment do

	price_tsv= "https://docs.google.com/spreadsheets/d/1udBI92bYU-3rYelSuhv0AY3KT0dQqIQjGx42Z1BKU8k/pub?gid=1607858933&single=true&output=tsv"
	btc_tsv  = "https://docs.google.com/spreadsheets/d/1udBI92bYU-3rYelSuhv0AY3KT0dQqIQjGx42Z1BKU8k/pub?gid=0&single=true&output=tsv"

	#######################
	# Create Prices
	########################
	puts "1. CREATING PRICE TABLE....\n"


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
	# # Historical BTC Prices
	# ########################

	puts "2. Creating Historical BTC Price DB\n"
	#0 - date	1 - symbol	2 - portfolio	3 - amount	4 - price_usd	5 - price_btc	6 - kind

	open(btc_tsv).drop(1).each do |line|;
		row = line.split("\t")

		Btcusd.create({
			date: row[0][0,10],
			price_usd: row[1].squish
		})

	end

end
