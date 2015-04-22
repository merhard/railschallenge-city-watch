class AddCodeUniqueIndexToEmergencies < ActiveRecord::Migration
  def change
    add_index :emergencies, :code, unique: true
  end
end
