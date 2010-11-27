class Schedule < ActiveRecord::Base
  has_many :diarys, :class_name => 'Diary'
end
