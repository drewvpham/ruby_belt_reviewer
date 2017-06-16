class EventsController < ApplicationController
  def index
    if session[:user_id]
      @user=User.find(session[:user_id])
      print @user.first_name
      @local_events=Event.where(state: @user.state)
      @other_events=Event.where.not(state: @user.state)
    end
  end

  def show
    @event=Event.find(params[:id])
    @comments=@event.comments.includes(:user)
  end

  


end
