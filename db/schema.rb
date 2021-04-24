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

ActiveRecord::Schema.define(version: 2021_04_14_032724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.bigint "company_id"
    t.string "api_key", limit: 255, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_api_keys_on_company_id"
  end

  create_table "attendance_records", force: :cascade do |t|
    t.bigint "members_id"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.interval "break_time"
    t.interval "work_time"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["members_id"], name: "index_attendance_records_on_members_id"
  end

  create_table "attendance_schedules", force: :cascade do |t|
    t.bigint "members_id"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.interval "break_time"
    t.interval "work_time"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["members_id"], name: "index_attendance_schedules_on_members_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.integer "plan", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "master_member_id"
    t.integer "limit_member_number"
    t.datetime "deleted_at"
    t.datetime "track_start_time", default: "1970-01-01 00:00:00", null: false
    t.datetime "track_stop_time", default: "1970-01-01 23:59:59", null: false
    t.index ["master_member_id"], name: "index_companies_on_master_member_id"
  end

  create_table "member_details", primary_key: "member_id", id: :bigint, default: nil, force: :cascade do |t|
    t.string "contract"
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "app_version"
    t.string "db_version"
    t.string "platform"
    t.index ["member_id"], name: "index_member_details_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name", limit: 30, null: false
    t.string "email", null: false
    t.string "password_digest", default: "", null: false
    t.string "token", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["company_id"], name: "index_members_on_company_id"
  end

  add_foreign_key "api_keys", "companies"
  add_foreign_key "attendance_records", "members", column: "members_id"
  add_foreign_key "attendance_schedules", "members", column: "members_id"
  add_foreign_key "companies", "members", column: "master_member_id"
end
