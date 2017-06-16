class CommentsController < ApplicationController
  def create
    @user=User.find(session[:user_id])
    @event=Event.find(params[:id])
    comment=Comment.create(user:@user.id, event:@event)
  end
end
