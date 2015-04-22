class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.timestamps null: false

      t.string :name
      t.string :type
      t.string :emergency_code
      t.integer :capacity
      t.boolean :on_duty, default: false
    end
  end
end
