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

ActiveRecord::Schema.define(version: 0) do

  create_table "actors", force: true do |t|
    t.string    "first_name",  limit: 45, null: false
    t.string    "last_name",   limit: 45, null: false
    t.timestamp "last_update",            null: false
  end

  create_table "addresses", force: true do |t|
    t.string    "address",     limit: 50, null: false
    t.string    "district",    limit: 20, null: false
    t.integer   "city_id",     limit: 2,  null: false
    t.string    "postal_code", limit: 10
    t.string    "phone",       limit: 20, null: false
    t.timestamp "last_update",            null: false
  end

  create_table "categories", force: true do |t|
    t.string    "name",        limit: 25, null: false
    t.timestamp "last_update",            null: false
  end

  create_table "cities", force: true do |t|
    t.string    "city",        limit: 50, null: false
    t.integer   "country_id",  limit: 2,  null: false
    t.timestamp "last_update",            null: false
  end

  create_table "countries", force: true do |t|
    t.string    "country",     limit: 50, null: false
    t.timestamp "last_update",            null: false
  end

  create_table "customers", force: true do |t|
    t.integer   "store_id",    limit: 1,                 null: false
    t.string    "first_name",  limit: 45,                null: false
    t.string    "last_name",   limit: 45,                null: false
    t.string    "email",       limit: 50
    t.integer   "address_id",  limit: 2,                 null: false
    t.boolean   "active",                 default: true, null: false
    t.datetime  "create_date",                           null: false
    t.timestamp "last_update",                           null: false
  end

  create_table "film_actor", id: false, force: true do |t|
    t.integer   "actor_id",    limit: 2, null: false
    t.integer   "film_id",     limit: 2, null: false
    t.timestamp "last_update",           null: false
  end

  create_table "film_category", id: false, force: true do |t|
    t.integer   "film_id",     limit: 2, null: false
    t.integer   "category_id", limit: 1, null: false
    t.timestamp "last_update",           null: false
  end

  create_table "films", force: true do |t|
    t.string    "title",                                                              null: false
    t.text      "description"
    t.integer   "release_year"
    t.integer   "language_id",      limit: 1,                                         null: false
    t.integer   "rental_duration",  limit: 1,                         default: 3,     null: false
    t.decimal   "rental_rate",                precision: 4, scale: 2, default: 4.99,  null: false
    t.integer   "length",           limit: 2
    t.decimal   "replacement_cost",           precision: 5, scale: 2, default: 19.99, null: false
    t.string    "rating",           limit: 5,                         default: "G"
    t.string    "special_features", limit: 0
    t.timestamp "last_update",                                                        null: false
  end

  create_table "filmtexts", force: true do |t|
    t.string "title",       null: false
    t.text   "description"
  end

  create_table "inventories", force: true do |t|
    t.integer   "film_id",     limit: 2, null: false
    t.integer   "store_id",    limit: 1, null: false
    t.timestamp "last_update",           null: false
  end

  create_table "languages", force: true do |t|
    t.string    "name",        limit: 20, null: false
    t.timestamp "last_update",            null: false
  end

  create_table "payments", force: true do |t|
    t.integer   "customer_id",  limit: 2,                         null: false
    t.integer   "staff_id",     limit: 1,                         null: false
    t.integer   "rental_id"
    t.decimal   "amount",                 precision: 5, scale: 2, null: false
    t.datetime  "payment_date",                                   null: false
    t.timestamp "last_update",                                    null: false
  end

  create_table "rentals", force: true do |t|
    t.datetime  "rental_date",            null: false
    t.integer   "inventory_id", limit: 3, null: false
    t.integer   "customer_id",  limit: 2, null: false
    t.datetime  "return_date"
    t.integer   "staff_id",     limit: 1, null: false
    t.timestamp "last_update",            null: false
  end

  create_table "staffs", force: true do |t|
    t.string    "first_name",  limit: 45,                null: false
    t.string    "last_name",   limit: 45,                null: false
    t.integer   "address_id",  limit: 2,                 null: false
    t.string    "email",       limit: 50
    t.integer   "store_id",    limit: 1,                 null: false
    t.boolean   "active",                 default: true, null: false
    t.string    "username",    limit: 16,                null: false
    t.string    "password",    limit: 40
    t.timestamp "last_update",                           null: false
  end

  create_table "stores", force: true do |t|
    t.integer   "manager_staff_id", limit: 1, null: false
    t.integer   "address_id",       limit: 2, null: false
    t.timestamp "last_update",                null: false
  end

end
