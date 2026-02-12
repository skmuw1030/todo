class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new 
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[ :notice ] = "登録しました"
      redirect_to schedules_path
    else
      Rails.logger.debug @schedule.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require( :schedule ).permit(
      :title,
      :start_date,
      :end_date,
      :all_day,
      :memo
    )
  end

end
