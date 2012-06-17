class AddRaceIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :race_id, :integer
  end
end
