# app/controllers/comments_controller.rb

class CommentsController < ApplicationController
  before_action :set_event
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def create
    @comment = @event.comments.build(comment_params.merge(user_id: current_user.id))

    if @comment.save
      redirect_to @event, notice: 'Comment was successfully created.'
    else
      redirect_to @event, alert: 'Error adding comment. Please try again.'
    end
  end

  def edit
    if @comment.user_id != current_user.id
      redirect_to @event, alert: 'You can only edit your own comments.'
    end
  end

  def update
    if @comment.user_id == current_user.id
      if @comment.update(comment_params)
        redirect_to @event, notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to @event, alert: 'You can only edit your own comments.'
    end
  end

  def destroy
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to @event, notice: 'Comment was successfully deleted.'
    else
      redirect_to @event, alert: 'You can only delete your own comments.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
