class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.integer :total_statement
      t.decimal :win_rate, precision: 3, scale: 2
      t.integer :loss
      t.integer :profit

      t.references :month, foreign_key: true
      t.timestamps
    end
    add_index :weeks, :win_rate, unique: false
  end
end
