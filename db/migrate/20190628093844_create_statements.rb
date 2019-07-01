class CreateStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :statements do |t|
      t.integer :money
      t.boolean :guess
      t.boolean :status
      t.decimal :stop_loss, precision: 4, scale: 2
      t.decimal :take_profit, precision: 4, scale: 2
      t.string :picture
      t.integer :loss
      t.integer :profit

      t.references :user_fund, foreign_key: true
      t.timestamps
    end
  end
end
