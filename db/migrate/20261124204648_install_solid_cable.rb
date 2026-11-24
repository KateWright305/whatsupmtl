class InstallSolidCable < ActiveRecord::Migration[8.1]
  def change
    ActiveRecord::Schema[8.1].define(version: 2026_11_24_153022) do
    # These are extensions that must be enabled in order to support this database
    enable_extension "pg_catalog.plpgsql"

      create_table "activities", force: :cascade do |t|
        t.string "name"
        t.text "description"
        t.string "url"
        t.string "location"
        t.decimal "price", precision: 10, scale: 2
        t.string "img"
        t.datetime "starts_at"
        t.datetime "ends_at"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "users", force: :cascade do |t|
        t.string "email", default: "", null: false
        t.string "encrypted_password", default: "", null: false
        t.string "reset_password_token"
        t.datetime "reset_password_sent_at"
        t.datetime "remember_created_at"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["email"], name: "index_users_on_email", unique: true
        t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
      end
    end
  end
end
