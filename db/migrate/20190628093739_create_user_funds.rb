class CreateUserFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :user_funds do |t|
      t.integer :current_money
      t.integer :money_limit
      t.boolean :founder
      t.references :user, foreign_key: true
      t.references :fund, foreign_key: true

      t.timestamps
    end
    add_index :user_funds, :founder, unique: false
  end
end
