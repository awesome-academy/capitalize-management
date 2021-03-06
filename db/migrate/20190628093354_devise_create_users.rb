class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :mobile_number
      t.text :address
      t.string :facebook
      t.string :name, default: ""
      t.string :encrypted_password, null: true, default: ""
      t.string :avatar

      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
  end
end
