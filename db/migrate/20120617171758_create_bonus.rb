class CreateBonus < ActiveRecord::Migration
  def change
    create_table :bonus do |t|
      t.integer :source_id
      t.string :source_type
      t.references :stat
      t.integer :stat_modifier

      t.timestamps
    end
    add_index :bonus, :stat_id
  end
end
