# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_03_124455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", default: "Enter a company name"
    t.string "address", default: "Enter a location"
    t.string "email", default: "Enter an email"
    t.string "phone", default: "0"
    t.string "description", default: "describe your services"
    t.string "category", default: "choose a category"
    t.decimal "pricing", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cover_photo"
    t.string "profile_photo"
    t.string "state", default: "Lagos"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.string "comment"
    t.string "rating"
    t.bigint "business_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_reviews_on_business_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "location"
    t.string "phone", default: "0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "state", default: "Lagos"
  end

  add_foreign_key "businesses", "users"
  add_foreign_key "reviews", "businesses"
end
