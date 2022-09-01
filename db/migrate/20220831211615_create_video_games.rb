class CreateVideoGames < ActiveRecord::Migration[7.0]
  def change
    create_table :video_games do |t|
      t.string :title
      t.string :platform
      t.string :genre
      t.decimal :rating

      t.timestamps
    end
  end
end
