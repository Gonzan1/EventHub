# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_02_030722) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "capacity"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.datetime "end_date"
    t.bigint "organizer_id", null: false
    t.datetime "start_date"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "venue_id", null: false
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["organizer_id"], name: "index_events_on_organizer_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "event_id", null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["event_id"], name: "index_registrations_on_event_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.bigint "event_id", null: false
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["event_id"], name: "index_reviews_on_event_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "encrypted_password"
    t.integer "role"
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events", "users", column: "organizer_id"
  add_foreign_key "events", "venues"
  add_foreign_key "registrations", "events"
  add_foreign_key "registrations", "users"
  add_foreign_key "reviews", "events"
  add_foreign_key "reviews", "users"
end
