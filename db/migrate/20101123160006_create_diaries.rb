class CreateDiaries < ActiveRecord::Migration
  def self.up
    create_table :diaries do |t|
      t.string :title
      t.integer :user_id
      t.string :comment
      t.integer :schedule_id

      t.timestamps
    end
  end

  def self.down
    drop_table :diaries
  end
end
