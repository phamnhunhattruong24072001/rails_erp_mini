class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string       :name,                 limit: 150,   null: false,    comment: "Tên đầy đủ của người dùng"
      t.string       :email,                limit: 150,   null: false,    comment: "Email đăng nhập (unique)"
      t.string       :phone,                limit: 20,    null: true,     comment: "Số điện thoại"
      t.string       :role,                 limit: 50,    null: false,    default: "staff", comment: "admin / staff / manager / user"
      t.string       :encrypted_password,   limit: 255,   null: false,    comment: "Mật khẩu mã hóa (BCrypt) – Devise compatible"
      t.integer      :status,               null: false,  default: 1,     comment: "1=active, 0=inactive, 2=banned"
      t.string       :avatar_url,           limit: 255,   null: true,     comment: "Link ảnh đại diện"
      t.timestamp    :last_login_at,        null: true,   comment:                 "Thời gian login gần nhất"
      t.integer      :login_failed_count,   null: true,   default: 0,     comment: "Số lần nhập sai mật khẩu"
      t.timestamp    :locked_until,         null: true,   comment:                 "Khóa tạm thời nếu nhập sai quá số lần"
      t.integer      :created_by,           null: true,   comment:                 "ID người tạo tài khoản"
      t.integer      :updated_by,           null: true,   comment:                 "ID người cập nhật"
      t.timestamp    :deleted_at,           null: true,   comment:                 "Soft delete (paranoia-compatible)"

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
