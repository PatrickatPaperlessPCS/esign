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

ActiveRecord::Schema.define(version: 20160124161301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baas", force: :cascade do |t|
    t.string   "signature"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "signature"
    t.string   "date"
    t.string   "text1"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "recipient"
    t.integer  "template_id"
    t.string   "authentication_token"
    t.string   "text2"
  end

  create_table "dynamic_textfields", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "text"
    t.integer  "left"
    t.integer  "top"
    t.integer  "document_id"
  end

  create_table "templates", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "attachment1_file_name"
    t.string   "attachment1_content_type"
    t.integer  "attachment1_file_size"
    t.datetime "attachment1_updated_at"
    t.integer  "user_id"
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "bgdoc_file_name"
    t.string   "bgdoc_content_type"
    t.integer  "bgdoc_file_size"
    t.datetime "bgdoc_updated_at"
    t.boolean  "subscribed"
    t.string   "plan"
    t.string   "name"
    t.string   "telephone"
    t.string   "company_name"
    t.string   "signature"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
