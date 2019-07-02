class CreateUserFunds < ActiveRecord::Migration[5.2]
  def change
    create_table :user_funds do |t|
      t.integer :current_money, default: 0
      t.integer :money_limit, default: 0
      t.references :user, foreign_key: true
      t.references :fund, foreign_key: true

      t.timestamps
    end
  end
end
