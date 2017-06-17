class CommentsController < ApplicationController
  def create
    @user=User.find(session[:user_id])
    @event=Event.find(params[:id])
    comment=Comment.create(user:@user, event:@event, content: params[:content])
    if !comment.valid?
      flash[:errors]=comment.errors.full_messages
    end
    redirect_to :back
  end

  def destroy
    comment=Comment.find(params[:id]).destroy
    redirect_to :back
  end



end
