# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
	{ currency_id: 'factum', name: 'Factum', symbol: 'FCT'},
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