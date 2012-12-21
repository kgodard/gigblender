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

ActiveRecord::Schema.define(:version => 20121219031124) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "phone"
    t.string   "covers_percentage"
    t.text     "description"
    t.boolean  "available_sunday",    :default => true
    t.boolean  "available_monday",    :default => true
    t.boolean  "available_tuesday",   :default => true
    t.boolean  "available_wednesday", :default => true
    t.boolean  "available_thursday",  :default => true
    t.boolean  "available_friday",    :default => true
    t.boolean  "available_saturday",  :default => true
    t.integer  "user_id"
    t.integer  "zipcode_id"
    t.string   "image"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "artists_genres", :id => false, :force => true do |t|
    t.integer "artist_id"
    t.integer "genre_id"
  end

  add_index "artists_genres", ["artist_id"], :name => "index_artists_genres_on_artist_id"
  add_index "artists_genres", ["genre_id"], :name => "index_artists_genres_on_genre_id"

  create_table "blackout_dates", :force => true do |t|
    t.date     "bdate"
    t.integer  "artist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "zipcodes", :force => true do |t|
    t.string   "zipcode"
    t.string   "primary_city"
    t.string   "state"
    t.string   "timezone"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
