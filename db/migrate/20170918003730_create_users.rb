class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.integer :lastScore
      t.integer :highScore
      t.string :region

      t.timestamps
    end
  end
end
