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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100630135926) do

  create_table "invoices", :force => true do |t|
    t.text     "by_company",     :limit => 255
    t.text     "by_address",     :limit => 255
    t.text     "to_company",     :limit => 255
    t.text     "to_address",     :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "item_title",     :limit => 255
    t.text     "quantity_title", :limit => 255
    t.text     "cost_title",     :limit => 255
    t.text     "tax_title",      :limit => 255
    t.text     "currency",       :limit => 255
    t.text     "template",       :limit => 255, :default => "both"
    t.text     "discount_type",  :limit => 255, :default => "%"
    t.decimal  "discount",                      :default => 0.0
    t.date     "due_by"
    t.date     "issued_on"
    t.text     "shorturl",       :limit => 255
  end

  create_table "items", :force => true do |t|
    t.integer  "invoice_id", :limit => 255
    t.text     "name",       :limit => 255
    t.integer  "quantity",                  :default => 0
    t.decimal  "cost",                      :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tax",        :limit => 255, :default => "0"
  end

end
