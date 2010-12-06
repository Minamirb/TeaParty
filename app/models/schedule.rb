class Schedule < ActiveRecord::Base
  belongs_to :shop
  has_many :diaries, :class_name => 'Diary'
  #  has_one :shop
  validates :title, :presence=>true
  validates :shop_id, :presence=>true
end
