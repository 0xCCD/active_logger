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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130405214647) do

  create_table "my_histories", :force => true do |t|
    t.string   "body"
    t.string   "user_id"
    t.string   "logged_for_id"
    t.string   "logged_for"
    t.integer  "level"
    t.boolean  "i18n"
    t.text     "detail"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "my_history_values", :force => true do |t|
    t.integer  "my_history_id"
    t.string   "key"
    t.text     "value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "encrypted_password"
    t.datetime "last_login_at"
    t.datetime "remember_created_at"
    t.boolean  "active"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "websites", :force => true do |t|
    t.string   "headline"
    t.text     "body"
    t.text     "keywords"
    t.text     "head"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
