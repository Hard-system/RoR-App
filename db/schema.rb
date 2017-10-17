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

ActiveRecord::Schema.define(version: 20170825063435) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "postcode"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "cabins", force: :cascade do |t|
    t.string   "name"
    t.integer  "beds"
    t.integer  "deck"
    t.integer  "ship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_id"], name: "index_cabins_on_ship_id"
  end

  create_table "cabins_reservations", id: false, force: :cascade do |t|
    t.integer "cabin_id",       null: false
    t.integer "reservation_id", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "number"
    t.string   "exp_date"
    t.string   "name_on_card"
    t.string   "organisation"
    t.integer  "customer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["customer_id"], name: "index_credit_cards_on_customer_id"
  end

  create_table "cruises", force: :cascade do |t|
    t.string   "name"
    t.integer  "ship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ship_id"], name: "index_cruises_on_ship_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "has_good_credit"
    t.boolean  "paid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "card_number"
    t.integer  "customer_id"
    t.integer  "reservation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["customer_id"], name: "index_payments_on_customer_id"
    t.index ["reservation_id"], name: "index_payments_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "cruise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cruise_id"], name: "index_reservations_on_cruise_id"
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.integer  "tonnage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
