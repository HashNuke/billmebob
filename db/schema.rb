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

ActiveRecord::Schema.define(:version => 20100328165402) do

  create_table "invoices", :force => true do |t|
    t.string   "by_company"
    t.string   "by_address"
    t.string   "to_company"
    t.string   "to_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_title"
    t.string   "quantity_title"
    t.string   "cost_title"
    t.string   "tax_title"
    t.string   "currency"
    t.string   "template",       :default => "both"
    t.string   "discount_type",  :default => "%"
    t.decimal  "discount",       :default => 0.0
    t.date     "due_by"
    t.date     "issued_on"
  end

  create_table "items", :force => true do |t|
    t.string   "invoice_id"
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "cost",       :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tax",                                       :default => "0"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "encrypted_password",   :limit => 40, :null => false
    t.string   "password_salt",                      :null => false
    t.string   "confirmation_token",   :limit => 20
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token", :limit => 20
    t.string   "remember_token",       :limit => 20
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
