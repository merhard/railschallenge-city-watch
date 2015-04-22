class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies do |t|
      t.timestamps null: false

      t.string :code
      t.integer :fire_severity
      t.integer :police_severity
      t.integer :medical_severity
      t.boolean :full_response, default: false
      t.datetime :resolved_at
    end
  end
end
