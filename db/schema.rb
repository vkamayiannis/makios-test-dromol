# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160719083446) do

  create_table "final_routes", id: false, force: :cascade do |t|
    t.integer  "id",         limit: nil,                null: false
    t.datetime "ftrdate"
    t.integer  "trsid",                  precision: 38
    t.integer  "syromenoid",             precision: 38
    t.integer  "supid",                  precision: 38
    t.integer  "cusid",                  precision: 38
    t.integer  "routetype",              precision: 38
    t.integer  "iswebroute",             precision: 38
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "webstatus",              precision: 38
  end

  create_table "route_receivers", id: false, force: :cascade do |t|
    t.integer  "id",          limit: nil, null: false
    t.integer  "route_id",    limit: nil, null: false
    t.integer  "customer_id", limit: nil, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", id: false, force: :cascade do |t|
    t.integer  "id",                limit: nil,                null: false
    t.integer  "customer_id",       limit: nil
    t.string   "route_desc"
    t.datetime "route_date"
    t.integer  "quantity",                      precision: 38
    t.float    "sales_value"
    t.float    "purchases_value"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "transportation_id", limit: nil
    t.datetime "loading_time"
    t.integer  "created",                       precision: 38
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                 default: "", null: false
    t.string   "encrypted_password",                    default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          precision: 38, default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "i_users_reset_password_token", unique: true

  add_synonym "customer", "makios.customer", force: true
  add_synonym "custaddress", "makios.custaddress", force: true
  add_synonym "transportation", "makios.transportation", force: true

end
