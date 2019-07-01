class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.integer :total_statement
      t.decimal :win_rate, precision: 3, scale: 2
      t.integer :loss
      t.integer :profit

      t.references :week, foreign_key: true
      t.references :user_fund, foreign_key: true
      t.timestamps
    end
    add_index :days, :win_rate, unique: false
  end
end
