class AddCurrentHpToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :current_hp, :integer
  end
end
