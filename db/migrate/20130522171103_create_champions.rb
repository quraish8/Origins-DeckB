class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.string :name
      t.integer :attack
      t.integer :aura
      t.integer :energy
      t.integer :health
      t.text :ability
      t.string :factions_json
      t.string :disciplines_json
      t.integer :set_id
      t.integer :card_number
      t.string :rarity

      t.timestamps
    end
  end
end
