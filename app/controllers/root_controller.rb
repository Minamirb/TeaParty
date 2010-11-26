class RootController < ApplicationController
  def menu

    @schedule = Schedule.find(:first, :order=> "id desc")  
    
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

end
