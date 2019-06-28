class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :money
      t.boolean :status
      t.references :user_fund, foreign_key: true

      t.timestamps
    end
  end
end
