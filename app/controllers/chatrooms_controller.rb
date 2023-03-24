class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new(user_1: current_user)
    @chatroom.user_2 = User.find(params[:user_id])
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end
end
