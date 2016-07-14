class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description, limit: 255, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps null: false
    end

    add_index :events, :start_date
    add_index :events, :end_date
  end
end
