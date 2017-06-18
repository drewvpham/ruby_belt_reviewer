class CommentsController < ApplicationController
  def create
    @event=Event.find(params[:id])
    comment=Comment.create(user:current_user, event:@event, content: params[:content])
    if !comment.valid?
      flash[:errors]=comment.errors.full_messages
    end
    redirect_to :back
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end
  
end
