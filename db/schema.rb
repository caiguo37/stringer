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

ActiveRecord::Schema.define(version: 20130905204142) do

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "feeds", force: true do |t|
    t.string   "name"
    t.text     "url",          limit: 255
    t.datetime "last_fetched"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  add_index "feeds", ["url"], name: "index_feeds_on_url", unique: true

  create_table "stories", force: true do |t|
    t.text     "title",       limit: 255
    t.text     "permalink",   limit: 255
    t.text     "body"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published"
    t.boolean  "is_read"
    t.boolean  "keep_unread",             default: false
    t.boolean  "is_starred",              default: false
    t.text     "entry_id",    limit: 255
  end

  add_index "stories", ["entry_id", "feed_id"], name: "index_stories_on_entry_id_and_feed_id", unique: true

  create_table "users", force: true do |t|
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "setup_complete"
    t.string   "api_key"
  end

end
