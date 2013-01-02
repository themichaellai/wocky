class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :ip
      t.integer :track_id

      t.timestamps
    end
    add_index :votes, [:track_id]
  end
end
