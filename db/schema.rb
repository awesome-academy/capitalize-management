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

ActiveRecord::Schema.define(version: 2019_06_28_093928) do

  create_table "days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "total_statement"
    t.decimal "win_rate", precision: 3, scale: 2
    t.integer "loss"
    t.integer "profit"
    t.bigint "week_id"
    t.bigint "user_fund_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_fund_id"], name: "index_days_on_user_fund_id"
    t.index ["week_id"], name: "index_days_on_week_id"
    t.index ["win_rate"], name: "index_days_on_win_rate"
  end

  create_table "funds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "total_money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "money"
    t.boolean "status"
    t.bigint "user_fund_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_fund_id"], name: "index_histories_on_user_fund_id"
  end

  create_table "months", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "total_statement"
    t.decimal "win_rate", precision: 3, scale: 2
    t.integer "loss"
    t.integer "profit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["win_rate"], name: "index_months_on_win_rate"
  end

  create_table "statements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "money"
    t.boolean "guess"
    t.boolean "status"
    t.decimal "stop_loss", precision: 4, scale: 2
    t.decimal "take_profit", precision: 4, scale: 2
    t.string "picture"
    t.integer "loss"
    t.integer "profit"
    t.bigint "user_fund_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_fund_id"], name: "index_statements_on_user_fund_id"
  end

  create_table "user_funds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "current_money"
    t.integer "money_limit"
    t.boolean "founder"
    t.bigint "user_id"
    t.bigint "fund_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["founder"], name: "index_user_funds_on_founder"
    t.index ["fund_id"], name: "index_user_funds_on_fund_id"
    t.index ["user_id"], name: "index_user_funds_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "encrypted_password", default: "", null: false
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "total_statement"
    t.decimal "win_rate", precision: 3, scale: 2
    t.integer "loss"
    t.integer "profit"
    t.bigint "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_weeks_on_month_id"
    t.index ["win_rate"], name: "index_weeks_on_win_rate"
  end

  add_foreign_key "days", "user_funds"
  add_foreign_key "days", "weeks"
  add_foreign_key "histories", "user_funds"
  add_foreign_key "statements", "user_funds"
  add_foreign_key "user_funds", "funds"
  add_foreign_key "user_funds", "users"
  add_foreign_key "weeks", "months"
end
