class AddUniqueIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :countries, :name, unique: true
    add_index :users, :name, unique: true
    add_index :filming_locations, :name, unique: true
  end
end
