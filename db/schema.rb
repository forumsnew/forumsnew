# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090426185208) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "coupons", :force => true do |t|
    t.string   "code"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount",                                     :null => false
    t.string   "discount_type", :limit => 10,                :null => false
    t.integer  "product_id",                  :default => 0
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.decimal  "amount",        :precision => 10, :scale => 2
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "product_id"
    t.string   "ip_address"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "forum_url"
    t.string   "forum_title"
    t.string   "coupon_code"
    t.string   "status",           :default => "Active"
    t.datetime "due"
    t.string   "express_token"
    t.string   "express_payer_id"
    t.text     "description"
  end

  create_table "orders_users", :id => false, :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "order_id", :null => false
  end

  create_table "participants", :id => false, :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "order_id", :null => false
    t.boolean "removed",  :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.string   "forum_username"
    t.string   "post_type"
    t.datetime "date"
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "members"
    t.integer  "posts"
    t.integer  "threads"
    t.decimal  "price",       :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "rating",                      :default => 0
    t.datetime "created_at",                                  :null => false
    t.string   "rateable_type", :limit => 15, :default => "", :null => false
    t.integer  "rateable_id",                 :default => 0,  :null => false
    t.integer  "user_id",                     :default => 0,  :null => false
  end

  add_index "ratings", ["user_id"], :name => "fk_ratings_user"

  create_table "settings", :force => true do |t|
    t.string   "site_name"
    t.boolean  "beta"
    t.decimal  "per_post",   :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "forename"
    t.string   "surname"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "town"
    t.string   "county"
    t.string   "postcode"
    t.string   "country"
    t.string   "hashed_password"
    t.string   "salt"
    t.integer  "rows",                                                              :null => false
    t.boolean  "admin",                                          :default => false, :null => false
    t.integer  "country_id"
    t.string   "paypal"
    t.datetime "created_at",                                                        :null => false
    t.boolean  "writer",                                         :default => false, :null => false
    t.integer  "max_jobs",                                       :default => 10
    t.decimal  "payment",         :precision => 10, :scale => 2, :default => 0.0
    t.integer  "per_post"
  end

end
