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

ActiveRecord::Schema[7.0].define(version: 2023_05_15_163738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chambers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_statements", force: :cascade do |t|
    t.integer "age_days"
    t.integer "age_weeks"
    t.integer "total_count"
    t.integer "deceased"
    t.integer "remaining"
    t.float "consumed_food"
    t.float "consumed_water"
    t.float "daily_production"
    t.float "production_ratio"
    t.float "highest_temp"
    t.float "lowest_temp"
    t.float "humidity_ratio"
    t.bigint "chamber_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chamber_id"], name: "index_daily_statements_on_chamber_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "action_name", null: false
    t.string "resource_name", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_name"], name: "index_permissions_on_action_name"
    t.index ["resource_name"], name: "index_permissions_on_resource_name"
  end

  create_table "user_permissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_user_permissions_on_permission_id"
    t.index ["user_id"], name: "index_user_permissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname", null: false
    t.string "lname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "authentication_token", null: false
    t.string "verification_code"
    t.datetime "verified_at"
    t.datetime "verification_code_sent_at"
    t.boolean "is_verified", default: false, null: false
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_statements", "chambers"
  add_foreign_key "user_permissions", "permissions"
  add_foreign_key "user_permissions", "users"
end
