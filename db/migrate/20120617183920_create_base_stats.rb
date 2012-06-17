class CreateBaseStats < ActiveRecord::Migration
  def change
    create_table :base_stats do |t|
      t.references :stat
      t.references :player
      t.integer :value

      t.timestamps
    end
    add_index :base_stats, :stat_id
    add_index :base_stats, :player_id
  end
end
