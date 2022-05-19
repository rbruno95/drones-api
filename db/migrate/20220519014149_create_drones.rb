class CreateDrones < ActiveRecord::Migration[7.0]
  def change
    create_table :drones do |t|
      t.string :serial_number, null: false
      t.integer :model, null: false, default: 0
      t.integer :weight_limit, null: false
      t.integer :battery_capacity, null: false
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
