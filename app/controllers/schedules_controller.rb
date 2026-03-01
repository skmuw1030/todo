class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @schedule_count = Schedule.count
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:notice] = "登録しました"
      redirect_to schedules_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :"new", status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:notice] = "スケジュールを更新しました"
      redirect_to schedules_path(@schedule)
    else
      flash.now[:alert] = "更新に失敗しました"
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to schedules_path
  end



  private

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :start_date,
      :end_date,
      :all_day,
      :memo
    )
  end
end
