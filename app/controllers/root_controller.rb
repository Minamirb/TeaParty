# -*- coding: utf-8 -*-
class RootController < ApplicationController
  def menu

    @schedule = Schedule.find(:first, :order=> "id desc")  
    @calendars = set_calendar
    
    if @schedule.nil?
      set_default
    end

    respond_to do |format|
      format.html
    end
  end

  private 
  def set_default
    @schedule = Schedule.new(:title=>"ようこそminami.rbへ", :start_date=>Date.new(2010, 6, 22)) 
    @schedule.shop = Shop.new(:name=>"Minami.rb", :url=>"http://qwik.jp/minamirb/",
               :address=>"大阪府大阪市中央区難波二丁目")
    @schedule
  end
  
  def set_calendar
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
    #["日", "月", "火", "水", "木", "金", "土"]
  end
end
