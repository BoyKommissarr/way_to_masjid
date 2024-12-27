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

ActiveRecord::Schema[7.2].define(version: 2024_12_27_023438) do
  create_table "areas", force: :cascade do |t|
    t.string "area_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_name"], name: "index_areas_on_area_name", unique: true
  end

  create_table "fasting_timings", force: :cascade do |t|
    t.time "sehri_start", null: false
    t.time "sehri_end", null: false
    t.time "iftaar", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mosques", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.text "google_link"
    t.integer "area_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_mosques_on_area_id"
    t.index ["user_id"], name: "index_mosques_on_user_id"
  end

  create_table "salah_timings", force: :cascade do |t|
    t.string "name", null: false
    t.time "timing", null: false
    t.integer "mosque_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mosque_id"], name: "index_salah_timings_on_mosque_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name", null: false
    t.string "phone_number"
    t.string "time_zone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mosques", "areas"
  add_foreign_key "mosques", "users"
  add_foreign_key "salah_timings", "mosques"
end
