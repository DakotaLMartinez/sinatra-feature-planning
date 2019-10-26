class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
