class UsersController < ApplicationController
  def index
    if params[:query].present?
      @users = User.global_search(params[:query])
    else
      @users = User.all
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def tag
    current_user.interest_list.each { |interest| current_user.interest_list.remove(interest) }
    params[:user][:interest_list].each do |tag|
      current_user.interest_list.add(tag) unless current_user.interest_list.include?(tag)
    end

    current_user.save
    redirect_to user_path(current_user)

  end
  def user_params
    params.require(:user).permit(:name, :interest_list)
  end
end
