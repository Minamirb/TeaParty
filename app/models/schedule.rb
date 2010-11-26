class Schedule < ActiveRecord::Base
  has_one :shop 
  has_many :diaries 
end
