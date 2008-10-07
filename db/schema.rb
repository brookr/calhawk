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

ActiveRecord::Schema.define(:version => 3) do

  create_table "event_versions", :force => true do |t|
    t.integer  "event_id"
    t.integer  "version"
    t.integer  "user_id"
    t.string   "summary",        :limit => 140
    t.string   "status",         :limit => 40
    t.string   "location",       :limit => 140
    t.string   "recur"
    t.string   "timezone"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.datetime "updated_at"
    t.string   "versioned_type", :limit => 40
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "type",        :limit => 40
    t.string   "summary",     :limit => 140
    t.string   "status",      :limit => 40
    t.string   "location",    :limit => 140
    t.string   "recur"
    t.string   "timezone"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "identity_url"
  end

  add_index "users", ["login"], :name => "index_users_on_login"

end
