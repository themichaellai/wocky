class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :artist
      t.string :spotify_uri
      t.integer :user_id

      t.timestamps
    end
  end
end
