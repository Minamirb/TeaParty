class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html
  
  #helper :application
  include ApplicationHelper
  before_filter :set_calendar
  before_filter { @javascripts = [] }
  
  def set_calendar
    @calendar_wdays = set_weeks
    @calendar_days  = set_days(nil)
  end
end
