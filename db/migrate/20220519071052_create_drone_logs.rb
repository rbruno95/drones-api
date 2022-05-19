class CreateDroneLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :drone_logs do |t|
      t.integer :drone_id, null: false
      t.integer :battery_capacity, null: false

      t.timestamps
    end
  end
end
