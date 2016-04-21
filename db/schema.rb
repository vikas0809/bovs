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

ActiveRecord::Schema.define(version: 20160420040612) do

  create_table "books", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "authorId",       limit: 4
    t.string   "category",       limit: 255
    t.text     "description",    limit: 65535
    t.float    "price",          limit: 24
    t.string   "publishedDate",  limit: 255
    t.string   "status",         limit: 255
    t.string   "condition",      limit: 255
    t.binary   "cover",          limit: 16777215
    t.binary   "bookfile",       limit: 16777215
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "Image_Filename", limit: 255
    t.string   "Image_Format",   limit: 255
    t.string   "Book_Filename",  limit: 255
    t.string   "Book_Format",    limit: 255
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "userId",      limit: 4
    t.integer  "bookId",      limit: 4
    t.integer  "quantity",    limit: 4
    t.float    "price",       limit: 24
    t.float    "tax",         limit: 24
    t.float    "totalAmount", limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstName",              limit: 255
    t.string   "lastName",               limit: 255
    t.string   "email",                  limit: 255
    t.string   "contactNumber",          limit: 255
    t.string   "streeAddress",           limit: 255
    t.string   "city",                   limit: 255
    t.string   "province",               limit: 255
    t.string   "postalCode",             limit: 255
    t.string   "country",                limit: 255
    t.integer  "userId",                 limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
