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

ActiveRecord::Schema[8.0].define(version: 2025_12_02_015100) do
  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 150, null: false, comment: "Tên đầy đủ của người dùng"
    t.string "email", limit: 150, null: false, comment: "Email đăng nhập (unique)"
    t.string "phone", limit: 20, comment: "Số điện thoại"
    t.string "role", limit: 50, default: "staff", null: false, comment: "admin / staff / manager / user"
    t.string "encrypted_password", null: false, comment: "Mật khẩu mã hóa (BCrypt) – Devise compatible"
    t.integer "status", default: 1, null: false, comment: "1=active, 0=inactive, 2=banned"
    t.string "avatar_url", comment: "Link ảnh đại diện"
    t.timestamp "last_login_at", comment: "Thời gian login gần nhất"
    t.integer "login_failed_count", default: 0, comment: "Số lần nhập sai mật khẩu"
    t.timestamp "locked_until", comment: "Khóa tạm thời nếu nhập sai quá số lần"
    t.integer "created_by", comment: "ID người tạo tài khoản"
    t.integer "updated_by", comment: "ID người cập nhật"
    t.timestamp "deleted_at", comment: "Soft delete (paranoia-compatible)"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end
end
