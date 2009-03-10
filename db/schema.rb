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

ActiveRecord::Schema.define(:version => 0) do

  create_table "access_log", :force => true do |t|
    t.string   "username",    :limit => 31
    t.string   "ip",                        :default => "", :null => false
    t.string   "modulename",  :limit => 63
    t.string   "querystring"
    t.datetime "time",                                      :null => false
    t.integer  "authorized",  :limit => 1
  end

  create_table "active_users", :force => true do |t|
    t.string   "user_login",      :limit => 50
    t.string   "user_pass",       :limit => 34,  :default => "", :null => false
    t.string   "user_nicename",   :limit => 101
    t.string   "user_email",      :limit => 50
    t.datetime "user_registered",                                :null => false
    t.string   "display_name",    :limit => 50
  end

  create_table "addresses", :force => true do |t|
    t.integer   "contact_id",                  :default => 0,      :null => false
    t.string    "type",          :limit => 50, :default => "home", :null => false
    t.string    "line1"
    t.string    "line2"
    t.string    "city"
    t.string    "state"
    t.string    "zip"
    t.string    "record_status", :limit => 50
    t.timestamp "timestamp",                                       :null => false
    t.string    "custom1"
  end

  add_index "addresses", ["id"], :name => "id", :unique => true

  create_table "calendars", :primary_key => "cal_id", :force => true do |t|
    t.string "name",                  :null => false
    t.string "type",    :limit => 50, :null => false
    t.string "link_id",               :null => false
    t.string "color",   :limit => 20, :null => false
  end

  add_index "calendars", ["name"], :name => "name"

  create_table "casemap_orig", :primary_key => "case_id", :force => true do |t|
    t.string "case_title", :default => "", :null => false
  end

  create_table "cases", :id => false, :force => true do |t|
    t.string "case_id", :limit => 50, :default => "", :null => false
    t.string "data",                  :default => "", :null => false
    t.string "value"
  end

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "conflicts", :force => true do |t|
    t.integer   "case_id",                   :default => 0,  :null => false
    t.integer   "contact_id",                :default => 0,  :null => false
    t.string    "contact_type",              :default => "", :null => false
    t.integer   "conflict",     :limit => 1, :default => 0,  :null => false
    t.string    "reason",                    :default => "", :null => false
    t.text      "data",                                      :null => false
    t.string    "saved_by",                  :default => "", :null => false
    t.timestamp "timestamp",                                 :null => false
  end

  create_table "contact_info", :id => false, :force => true do |t|
    t.integer   "contact_id", :null => false
    t.string    "field",      :null => false
    t.string    "display",    :null => false
    t.string    "data"
    t.timestamp "modified",   :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string    "type",                          :default => ""
    t.string    "status"
    t.string    "first",           :limit => 50
    t.string    "last",            :limit => 50
    t.string    "home",            :limit => 50
    t.string    "fax",             :limit => 50
    t.string    "cell",            :limit => 50
    t.string    "work",            :limit => 50
    t.string    "phone_primary",   :limit => 20, :default => "cell", :null => false
    t.integer   "current",         :limit => 1
    t.string    "ssn",             :limit => 50
    t.string    "dob",             :limit => 50
    t.string    "email",           :limit => 50
    t.string    "case_type"
    t.string    "case_id"
    t.text      "intake_notes"
    t.integer   "pnc",             :limit => 1
    t.string    "referral",        :limit => 20, :default => "1"
    t.string    "referral_choice"
    t.string    "referral_text"
    t.string    "relation",                      :default => ""
    t.string    "billable",        :limit => 20, :default => "",     :null => false
    t.string    "comment"
    t.string    "record_status",   :limit => 50
    t.timestamp "timestamp",                                         :null => false
    t.string    "link_to"
    t.string    "link_case"
  end

  add_index "contacts", ["last"], :name => "tblClientClientLasName"

  create_table "cx_stats", :id => false, :force => true do |t|
    t.string  "username", :limit => 50, :default => "", :null => false
    t.string  "cx_value",               :default => "", :null => false
    t.integer "count",                  :default => 1,  :null => false
  end

  add_index "cx_stats", ["username", "cx_value"], :name => "user_cx", :unique => true

  create_table "emailrecords", :primary_key => "email_id", :force => true do |t|
    t.integer "email_time",       :limit => 8,   :default => 0,  :null => false
    t.string  "email_to",         :limit => 127, :default => "", :null => false
    t.string  "email_subject",                   :default => "", :null => false
    t.text    "email_body",                                      :null => false
    t.string  "email_type",       :limit => 31,  :default => "", :null => false
    t.string  "email_randstring", :limit => 7
    t.integer "email_success",    :limit => 1,   :default => 0,  :null => false
  end

  create_table "event_versions", :force => true do |t|
    t.integer "event_id"
    t.integer "version"
  end

  create_table "events", :primary_key => "event_id", :force => true do |t|
    t.string    "case_id"
    t.integer   "creator_id",                        :null => false
    t.integer   "user_id"
    t.string    "summary",                           :null => false
    t.text      "description"
    t.string    "status",      :default => "active", :null => false
    t.datetime  "dtstart",                           :null => false
    t.datetime  "dtend"
    t.string    "rrule"
    t.string    "location"
    t.datetime  "dtstamp",                           :null => false
    t.string    "alarm"
    t.string    "calendar_id",                       :null => false
    t.string    "event_type",                        :null => false
    t.boolean   "completed",   :default => false,    :null => false
    t.boolean   "busy",        :default => true,     :null => false
    t.string    "timezone",    :default => "SYSTEM", :null => false
    t.timestamp "updated_at",                        :null => false
    t.timestamp "created_at",                        :null => false
    t.integer   "version"
  end

  add_index "events", ["dtstart"], :name => "owner"

  create_table "events_users", :id => false, :force => true do |t|
    t.integer "event_id", :null => false
    t.integer "user_id",  :null => false
  end

  add_index "events_users", ["user_id"], :name => "user_id"

  create_table "mod_upload_files", :force => true do |t|
    t.string   "name"
    t.string   "filename"
    t.string   "ext",         :limit => 15
    t.string   "user_name",                 :default => "", :null => false
    t.text     "description"
    t.integer  "deleted"
    t.datetime "modified"
  end

  create_table "modules", :primary_key => "name", :force => true do |t|
    t.string  "title"
    t.string  "category"
    t.text    "description"
    t.integer "position"
  end

  create_table "modules_roles", :id => false, :force => true do |t|
    t.string "module_name", :default => "", :null => false
    t.string "role_name",   :default => "", :null => false
  end

  add_index "modules_roles", ["role_name"], :name => "role_name"

  create_table "notes", :primary_key => "note_id", :force => true do |t|
    t.string    "module",    :limit => 50, :default => "", :null => false
    t.string    "topic",                   :default => "", :null => false
    t.string    "title",                   :default => "", :null => false
    t.string    "sender",                  :default => "", :null => false
    t.text      "message",                                 :null => false
    t.string    "case_id",   :limit => 50
    t.timestamp "timestamp"
    t.string    "edited"
    t.integer   "parent_id"
  end

  add_index "notes", ["case_id"], :name => "case_id"
  add_index "notes", ["parent_id"], :name => "parent_id"

  create_table "notes_archive", :force => true do |t|
    t.integer   "note_id",                                 :null => false
    t.string    "module",    :limit => 50, :default => "", :null => false
    t.string    "topic",                   :default => "", :null => false
    t.string    "title",                   :default => "", :null => false
    t.string    "sender",                  :default => "", :null => false
    t.text      "message",                                 :null => false
    t.string    "case_id",   :limit => 50
    t.timestamp "timestamp"
    t.string    "edited"
    t.integer   "parent_id"
  end

  add_index "notes_archive", ["case_id"], :name => "case_id"
  add_index "notes_archive", ["parent_id"], :name => "parent_id"

  create_table "roles", :primary_key => "name", :force => true do |t|
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.string "user_name", :default => "", :null => false
    t.string "role_name", :default => "", :null => false
  end

  add_index "roles_users", ["role_name"], :name => "role_name"

  create_table "status_notes", :id => false, :force => true do |t|
    t.integer   "note_id",                 :default => 0,  :null => false
    t.string    "module",    :limit => 50, :default => "", :null => false
    t.string    "topic",                   :default => "", :null => false
    t.string    "title",                   :default => "", :null => false
    t.string    "sender",                  :default => "", :null => false
    t.text      "message",                                 :null => false
    t.string    "case_id",   :limit => 50
    t.timestamp "timestamp"
    t.string    "edited"
    t.integer   "parent_id"
  end

  create_table "users", :id => false, :force => true do |t|
    t.integer   "user_id",                                                    :null => false
    t.string    "login",                     :limit => 50
    t.string    "name",                      :limit => 100
    t.string    "email",                     :limit => 100
    t.string    "crypted_password",          :limit => 50
    t.string    "salt",                      :limit => 50
    t.datetime  "created_at"
    t.datetime  "updated_at"
    t.string    "remember_token",            :limit => 50
    t.datetime  "remember_token_expires_at"
    t.string    "identity_url"
    t.string    "user_name",                                :default => "",   :null => false
    t.integer   "contact_id"
    t.string    "user_first"
    t.string    "user_last"
    t.string    "user_email"
    t.string    "user_location",                            :default => "1|"
    t.timestamp "location_updated",                                           :null => false
    t.string    "email_lists"
    t.string    "user_password"
    t.string    "user_remoteaddr"
    t.string    "user_confirmhash"
    t.integer   "user_isconfirmed",                         :default => 0,    :null => false
    t.integer   "user_adminconfirmed"
    t.text      "user_description"
  end

  create_table "zips", :primary_key => "zip", :force => true do |t|
    t.string "latitude",  :limit => 20, :default => "", :null => false
    t.string "longitude", :limit => 20, :default => "", :null => false
    t.string "city",      :limit => 30, :default => "", :null => false
    t.string "state",     :limit => 30, :default => "", :null => false
    t.string "county",    :limit => 30, :default => "", :null => false
    t.string "class",     :limit => 20, :default => "", :null => false
  end

end
