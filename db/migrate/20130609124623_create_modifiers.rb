class CreateModifiers < ActiveRecord::Migration
  def change
    create_table :modifiers do |t|
      t.string :name
      t.belongs_to :character, index: true

      t.timestamps
    end
  end
end
