class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.datetime :query_time
      t.references :coin, foreign_key: true
      t.integer :rank
      t.float :price_usd
      t.float :price_btc
      t.float :volume_usd
      t.float :market_cap_usd
      t.float :available_supply
      t.float :total_supply
      t.integer :last_updated

      t.timestamps
    end
  end
end
