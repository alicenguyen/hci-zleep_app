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

ActiveRecord::Schema.define(version: 20140226070043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alarms", force: true do |t|
    t.string   "title"
    t.string   "wakeup_reminder_type"
    t.string   "sleeping_hour"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sleeping_minute"
    t.string   "is_dismiss"
    t.string   "sleep_reminder_time"
    t.string   "sleep_reminder_type"
    t.string   "sleeping_ampm"
    t.string   "repeat_monday"
    t.string   "repeat_tuesday"
    t.string   "repeat_wednesday"
    t.string   "repeat_thursday"
    t.string   "repeat_friday"
    t.string   "repeat_saturday"
    t.string   "repeat_sunday"
    t.string   "wakeup_hour"
    t.string   "wakeup_minute"
    t.string   "wakeup_ampm"
    t.string   "sleep_reminder_time_unit"
  end

  add_index "alarms", ["user_id"], name: "index_alarms_on_user_id", using: :btree

  create_table "reminders", force: true do |t|
    t.integer  "alarm_id"
    t.integer  "user_id"
    t.string   "reminder_hour"
    t.string   "reminder_minute"
    t.boolean  "call"
    t.boolean  "sms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "fb_token"
    t.string   "location"
    t.string   "fb_url"
    t.string   "username"
    t.string   "phone_number"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
