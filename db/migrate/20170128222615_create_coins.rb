class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.string :currency_id
      t.string :name
      t.string :symbol

      t.timestamps
    end
  end
end
