class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :coin, foreign_key: true
      t.datetime :date
      t.float :amount
      t.float :price_usd
      t.float :price_btc
      t.string :kind

      t.timestamps
    end
  end
end
