class CreateScoreBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :score_boards do |t|
      t.integer :user_id
      t.integer :highScore

      t.timestamps
    end
  end
end
