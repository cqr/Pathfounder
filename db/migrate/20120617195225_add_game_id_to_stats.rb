class AddGameIdToStats < ActiveRecord::Migration
  def change
    add_column :stats, :game_id, :integer
  end
end
