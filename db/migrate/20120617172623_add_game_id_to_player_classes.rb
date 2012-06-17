class AddGameIdToPlayerClasses < ActiveRecord::Migration
  def change
    add_column :player_classes, :game_id, :integer
  end
end
