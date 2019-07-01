class CreateMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :months do |t|
      t.integer :total_statement
      t.decimal :win_rate, precision: 3, scale: 2
      t.integer :loss
      t.integer :profit

      t.timestamps
    end
    add_index :months, :win_rate, unique: false
  end
end
