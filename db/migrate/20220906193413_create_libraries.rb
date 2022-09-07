class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :video_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
