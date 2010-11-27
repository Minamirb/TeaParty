class Shop < ActiveRecord::Base
  has_many :schedules, :class_name => 'Schedule'
  has_many :diaries, :through => :schedules, :class_name => 'Diary'
end
