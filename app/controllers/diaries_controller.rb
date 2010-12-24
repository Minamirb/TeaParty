class DiariesController < ApplicationController
  before_filter :current_schedule

  # GET /diaries
  # GET /diaries.xml
  def index
    @diaries = Diary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diaries }
    end
  end

  # GET /diaries/1
  # GET /diaries/1.xml
  def show
    @diary = Diary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diary }
    end
  end

  # GET /diaries/new
  # GET /diaries/new.xml
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @diary = Diary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diary }
    end
  end

  # GET /diaries/1/edit
  def edit
    @diary = Diary.find(params[:id])
  end

  def create
    @diary = current_schedule.diaries.new(params[:diary])
    success = @diary.save
    respond_with([@diary.schedule, @diary])
  end

  def update
    @diary = current_schedule.diaries.find(params[:id])
    @diary.update_attributes(params[:diary])
    respond_with([@diary.schedule, @diary])
  end

  def destroy
    @diary = current_schedule.diaries.find(params[:id])
    msg = (@diary.destroy) ? {:notice => 'success'} : {:alert => 'failure'}
    respond_with(@diary) do |f|
      f.html{ redirect_to(schedule_diaries_url, msg) }
    end
  end

  private
  def current_schedule
    @schedule ||= Schedule.find(params[:schedule_id])
  end
end
