class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:my_events]

  def index
    if params[:query].present?
      @users = User.global_search(params[:query])
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @chatroom = Chatroom.where(user_1: current_user, user_2: @user).or(Chatroom.where(user_1: @user, user_2: current_user)).first
  end

  def tag
    current_user.taggings.destroy_all
    params[:user][:interest_list].each do |tag|
    current_user.interest_list.add(tag)
  end


    current_user.save
    redirect_to user_path(current_user)
  end

  def my_events
    @my_events = current_user.events_attending

    @my_events_markers = @my_events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { event: event }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def my_chats
    chatrooms = Chatroom.where("user_1_id = ? OR user_2_id = ?", current_user.id, current_user.id)
    @chatrooms = chatrooms.sort_by { |chatroom| chatroom.messages.order(created_at: :desc).first&.created_at || Time.at(0) }.reverse
  end

  def user_params
    params.require(:user).permit(:name, :interest_list)
  end
end
