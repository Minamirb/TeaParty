class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :shop_id

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
