class CoinapisController < ApplicationController
	skip_before_action :verify_authenticity_token

	def getbtcprice



		d1 = Date.parse(params[:date])
		d2 = d1 + 1

		price = Btcusd.where("date >= ? AND date < ?",d1,d2).first

		#where(params[:date] == :date)

		if !price.nil?
        	render :text => price.price_usd
        else
        	render :text => "date not found"
        end
    end 
end
