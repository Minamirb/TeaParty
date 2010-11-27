class AddScheduleidToDiary < ActiveRecord::Migration
  def self.up
    add_column :diaries, :schedule_id, :integer
  end

  def self.down
  end
end
