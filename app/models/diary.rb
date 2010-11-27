class Diary < ActiveRecord::Base
  belongs_to :shop
  belongs_to :schedule
#  belongs_to :users
end
