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

ActiveRecord::Schema.define(version: 20171012195242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_transactions", force: :cascade do |t|
    t.bigint "bank_account_id"
    t.bigint "appreciation_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appreciation_id"], name: "index_account_transactions_on_appreciation_id"
    t.index ["bank_account_id"], name: "index_account_transactions_on_bank_account_id"
  end

  create_table "appreciations", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "points"
    t.string "token"
    t.boolean "given", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appreciations_on_user_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_transactions", "appreciations"
  add_foreign_key "account_transactions", "bank_accounts"
  add_foreign_key "appreciations", "users"
  add_foreign_key "bank_accounts", "users"
end
