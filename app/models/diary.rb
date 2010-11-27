class Diary < ActiveRecord::Base
  belongs_to :shop
  belongs_to :schedule
end
