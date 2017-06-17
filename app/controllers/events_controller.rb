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
    @user=User.find(session[:user_id])
    @event=Event.find(params[:id])
    @comments=@event.comments.includes(:user)
  end

  def create
    @user=User.find(session[:user_id])
    @event= Event.create(event_params.merge(user:@user))
    if @event.valid?

      redirect_to events_path
    end
  end

  def destroy
    Event.destroy(params[:id])
    redirect_to events_path
  end

  def edit
    @event=Event.find(params[:id])
  end

  def update
    @event=Event.find(params[:id])
    @event.update(event_params)
    redirect_to events_path
  end
  private

  def event_params
    params.require(:event).permit(:name, :location, :state, :date)
  end


end
