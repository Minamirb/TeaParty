# -*- coding: utf-8 -*-
module ApplicationHelper
  def set_weeks
    ["日", "月", "火", "水", "木", "金", "土"]
  end
  
  def set_days(date)
    now = Time.now
    now_month_first = Date.new(now.year,now.month,1)
    nxt_month_first = nil
    now_mf_wday = now_month_first.wday
    
    unless(now.month == 12)
      # January .. November
      nxt_month_first = Date.new(now.year,now.month+1,1)
    else
      # December
      nxt_month_first = Date.new(now.year+1,1,1)
    end
    
    raise 'err' unless (nxt_month_first - now_month_first).denominator == 1
    
    nday = (nxt_month_first - now_month_first).round
    days = []
    weeks = nil
    (Array.new(now_mf_wday) + (1..nday).to_a).each_with_index{|d,i|
      if i % 7 == 0
        days << weeks if weeks
        weeks = []
      end
      weeks << (d ? d : '')
    }
    days << weeks
    
    days
  end
end
