class AddNameUniqueIndexToResponders < ActiveRecord::Migration
  def change
    add_index :responders, :name, unique: true
  end
end
