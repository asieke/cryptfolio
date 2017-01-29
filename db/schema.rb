# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170129181818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "btcusds", force: :cascade do |t|
    t.datetime "date"
    t.float    "price_usd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coins", force: :cascade do |t|
    t.string   "currency_id"
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "prices", force: :cascade do |t|
    t.datetime "query_time"
    t.integer  "coin_id"
    t.integer  "rank"
    t.float    "price_usd"
    t.float    "price_btc"
    t.float    "volume_usd"
    t.float    "market_cap_usd"
    t.float    "available_supply"
    t.float    "total_supply"
    t.integer  "last_updated"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["coin_id"], name: "index_prices_on_coin_id", using: :btree
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "coin_id"
    t.datetime "date"
    t.float    "amount"
    t.float    "price_usd"
    t.float    "price_btc"
    t.string   "kind"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "portfolio_id"
    t.index ["coin_id"], name: "index_transactions_on_coin_id", using: :btree
    t.index ["portfolio_id"], name: "index_transactions_on_portfolio_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "prices", "coins"
  add_foreign_key "transactions", "coins"
  add_foreign_key "transactions", "portfolios"
end
