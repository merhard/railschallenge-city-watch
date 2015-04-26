class RemoveEmergencyCodeFromResponders < ActiveRecord::Migration
  def up
    remove_column :responders, :emergency_code
  end

  def down
    add_column :responders, :emergency_code, :string
  end
end
