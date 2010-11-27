class AddShopidToSchedule < ActiveRecord::Migration
  def self.up
    add_column :schedules, :shop_id, :integer
  end

  def self.down
  end
end
