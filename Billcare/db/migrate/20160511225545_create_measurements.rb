class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :biller_id
      t.integer :value
      t.integer :time

      t.timestamps null: false
    end
  end
end
