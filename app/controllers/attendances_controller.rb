class AttendancesController < ApplicationController
  
  def create
    @event=Event.find(params[:event])
    Attendance.create(user:current_user, event: @event)
    redirect_to :back
  end

  def destroy
    Attendance.find_by(event: Event.find(params[:id]), user: current_user).destroy
    redirect_to :back
  end

end
