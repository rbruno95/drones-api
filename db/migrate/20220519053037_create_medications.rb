class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name, null: false
      t.integer :weight, null: false
      t.string :code, null: false
      t.integer :drone_id

      t.timestamps
    end
  end
end
