desc "This task is called by the Heroku scheduler add-on"

require 'rubygems' #otherwise ,require 'json' will fail
require 'json'
require 'net/http'


task :update_prices => :environment do
	#get all the tracked coins
	coins = Coin.all

	#hash them
	hash = {};
	coins.each do |x|
		hash[x.id] = x.currency_id
	end

	#iterate through all the coinmarketcap data

	data = JSON.parse(open('https://api.coinmarketcap.com/v1/ticker').read)
	qt = DateTime.now;


	data.each_with_index{  |x, i| 

		#if its a tracked coin then grab its financials

		if x['id'] == 'bitcoin'
			Btcusd.create(:date => qt.utc, :price_usd => x['price_usd'])
		end

		if hash.has_value?(x['id'])
			coin_id = hash.key(x['id'])

			Price.create(
			:query_time => qt,
			:coin_id => coin_id,
			:rank => x['rank'],
			:price_usd => x['price_usd'],
			:price_btc => x['price_btc'],
			:volume_usd => x['24h_volume_usd'],
			:market_cap_usd => x['market_cap_usd'],
			:available_supply => x['available_supply'],
			:total_supply => x['total_supply'],
			:last_updated => x['last_updated']
			)
		end

	}
end
