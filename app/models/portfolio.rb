class Portfolio < ApplicationRecord
	validates_uniqueness_of :name
	has_many :transactions

# id  | coin_id |        date         |   amount    | price_usd | price_btc  | kind |         created_at         |         updated_at         | portfolio_id 
# -----+---------+---------------------+-------------+-----------+------------+------+----------------------------+----------------------------+--------------
#  206 |     331 | 2015-03-11 00:00:00 |  1.08335953 |       297 | 1.08335953 | Buy  | 2017-02-02 23:09:26.286727 | 2017-02-02 23:09:26.286727 |           47
#  207 |     331 | 2015-03-19 00:00:00 |           1 |       267 |          1 | Buy  | 2017-02-02 23:09:26.29381  | 2017-02-02 23:09:26.29381  |           47
#  208 |     331 | 2015-07-06 00:00:00 |           5 |     279.8 |          5 | Buy  | 2017-02-02 23:09:26.299738 | 2017-02-02 23:09:26.299738 |           47
#  209 |     331 | 2015-08-17 00:00:00 |           5 |     260.8 |          5 | Buy  | 2017-02-02 23:09:26.307674 | 2017-02-02 23:09:26.307674 |           47
#  210 |     331 | 2015-08-27 00:00:00 |          12 |    229.85 |         12 | Buy  | 2017-02-02 23:09:26.314542 | 2017-02-02 23:09:26.314542 |           47
#  211 |     331 | 2016-03-14 00:00:00 |          10 |    419.04 |         10 | Buy  | 2017-02-02 23:09:26.320238 | 2017-02-02 23:09:26.320238 |           47


	def totals
		json =  { "tot_cost_usd" => 0, "txn" => 0, "market_value" => 0 }
		txn = Transaction.where(["portfolio_id = ?", self.id])
		txn.each do |t|
			json["txn"] += 1;
			if t.kind == "Buy" 
				json["tot_cost_usd"] += t.amount * t.price_usd;
				json["market_value"] += t.amount * t.coin.current_price;

			end
			if t.kind == "Sell"
				json["tot_cost_usd"] -= t.amount * t.price_usd;
				json["market_value"] -= t.amount * t.coin.current_price;
			end
		end
		return json
	end
	

	def positions
		txn = Transaction.where(["portfolio_id = ?", self.id])

		pos = {};
		txn.each do |t|

			if pos[t.coin.symbol].nil?
				pos[t.coin.symbol] = {}
				pos[t.coin.symbol]['amount'] = 0;
				pos[t.coin.symbol]['tot_cost_usd'] = 0;
				pos[t.coin.symbol]['avg_cost_usd'] = 0;
				pos[t.coin.symbol]['txn'] = 0;
				pos[t.coin.symbol]['current_price'] = t.coin.current_price;
				pos[t.coin.symbol]['market_value'] = 0;
			end

			pos[t.coin.symbol]['name'] = t.coin.name


			pos[t.coin.symbol]['txn'] += 1;
			if t.kind == "Buy" 
				pos[t.coin.symbol]['amount'] += t.amount;
				pos[t.coin.symbol]['tot_cost_usd'] += t.amount * t.price_usd;
			end
			if t.kind == "Sell"
				pos[t.coin.symbol]['amount'] -= t.amount;
				pos[t.coin.symbol]['tot_cost_usd'] -= t.amount * t.price_usd;
			end
			
			pos[t.coin.symbol]['avg_cost_usd'] = pos[t.coin.symbol]['tot_cost_usd'] / pos[t.coin.symbol]['amount']
			pos[t.coin.symbol]['market_value'] = pos[t.coin.symbol]['amount'] * pos[t.coin.symbol]['current_price']

		end


		return pos
	end
end
