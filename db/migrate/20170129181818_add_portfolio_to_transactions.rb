class AddPortfolioToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :portfolio, foreign_key: true
  end
end
