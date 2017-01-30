# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Coin.delete_all
Coin.create([
	{ currency_id: 'bitcoin', name: 'Bitcoin', symbol: 'BTC'},
	{ currency_id: 'ethereum', name: 'Ethereum', symbol: 'ETH'},
	{ currency_id: 'ripple', name: 'Ripple', symbol: 'XRP'},
	{ currency_id: 'litecoin', name: 'Litecoin', symbol: 'LTC'},
	{ currency_id: 'monero', name: 'Monero', symbol: 'XMR'},
	{ currency_id: 'ethereum-classic', name: 'Ethereum Classic', symbol: 'ETC'},
	{ currency_id: 'dash', name: 'Dash', symbol: 'DASH'},
	{ currency_id: 'augur', name: 'Augur', symbol: 'REP'},
	{ currency_id: 'maidsafecoin', name: 'MaidSafeCoin', symbol: 'MAID'},
	{ currency_id: 'stratis', name: 'Stratis', symbol: 'STRAT'},
	{ currency_id: 'factom', name: 'Factom', symbol: 'FCT'},
	{ currency_id: 'zcash', name: 'ZCash', symbol: 'ZEC'},
	{ currency_id: 'waves', name: 'Waves', symbol: 'WAVES'},
	{ currency_id: 'iconomi', name: 'Iconomi', symbol: 'ICN'},
	{ currency_id: 'shadowcoin', name: 'ShadowCash', symbol: 'SDC'},
	{ currency_id: 'potcoin', name: 'Potcoin', symbol: 'POT'},
	{ currency_id: 'nxt', name: 'NXT', symbol: 'NXT'},
	{ currency_id: 'ardor', name: 'Ardor', symbol: 'ARDR'},
	{ currency_id: 'library-credit', name: 'LBRY Credits', symbol: 'LBC'},
	{ currency_id: 'steem', name: 'STEEM', symbol: 'STEEM'},
	{ currency_id: 'byteball', name: 'Byteball', symbol: 'GBYTE'},
	{ currency_id: 'zcoin', name: 'ZCoin', symbol: 'XZC'}
	]);


Portfolio.delete_all
Portfolio.create([
	{name: 'Polo', description: 'Coins stored on Poloniex'},
	{name: 'Bitcoin', description: 'Bitcoin Cold Storage'},
	{name: 'Experiment', description: 'Experimental Fund'},
	{name: 'Altcoin', description: 'Altcoins in Cold Storage'}
]);

Transaction.delete_all
Create Seed Transactions
data = JSON.parse(open('https://s3-us-west-2.amazonaws.com/cryptfolio/txn.json').read)

data.each do |row|
	coin_id = Coin.where(symbol: row['symbol']).first.id
	portfolio_id = Portfolio.where(name: row['portfolio']).first.id

	Transaction.create({
		 coin_id: coin_id,
		 portfolio_id: portfolio_id,
		 date: row['date'],
		 amount: row['amount'],
		 price_usd: row['price_usd'],
		 price_btc: row['price_btc'],
		 kind: row['kind']
	});
end

Price.delete_all
data = JSON.parse(open('https://s3-us-west-2.amazonaws.com/cryptfolio/prices.json').read)
data.each do |row|
	coin_id = Coin.where(symbol: row['symbol']).first.id
	Price.create({
		query_time: row['date'],
		coin_id: coin_id,
		rank: row['rank'],
		price_usd: row['price_usd'],
		price_btc: row['price_btc'],
		volume_usd: row['volume_usd'],
		market_cap_usd: row['market_cap_usd'],
		available_supply: row['available_supply']
	})

end

Btcusd.delete_all
data = JSON.parse(open('https://s3-us-west-2.amazonaws.com/cryptfolio/bitusd.json').read)

data.each do |row|
	Btcusd.create({
		date: row['date'],
		price_usd: row['price_usd']
	})
end


# Btcusd.create()