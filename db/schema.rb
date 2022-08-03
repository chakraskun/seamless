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

ActiveRecord::Schema[7.0].define(version: 2022_07_29_032330) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.decimal "longitude"
    t.decimal "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "question", null: false
    t.string "answer", null: false
    t.integer "order", null: false
    t.boolean "is_shown", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "name"
    t.uuid "company_id"
    t.string "username"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
  end

  create_table "works", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "project_name", null: false
    t.string "slug", null: false
    t.string "client_name", null: false
    t.string "content"
    t.integer "year", null: false
    t.uuid "categories_id", null: false
    t.boolean "is_shown", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_works_on_categories_id"
  end

  add_foreign_key "works", "categories", column: "categories_id"
end
