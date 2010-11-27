class Schedule < ActiveRecord::Base
  belongs_to :shop
  has_many :diaries, :class_name => 'Diary'
#  has_one :shop 
end
