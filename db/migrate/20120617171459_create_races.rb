class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.references :game
      t.string :name

      t.timestamps
    end
    add_index :races, :game_id
  end
end
