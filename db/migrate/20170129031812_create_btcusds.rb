class CreateBtcusds < ActiveRecord::Migration[5.0]
  def change
    create_table :btcusds do |t|
      t.datetime :date
      t.float :price_usd

      t.timestamps
    end
  end
end
