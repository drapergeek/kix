class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :player_name
      t.string :character_name
      t.integer :max_hp

      t.timestamps
    end
  end
end
