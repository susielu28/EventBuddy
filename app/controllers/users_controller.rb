class UsersController < ApplicationController
  def index
    if params[:query].present?
      @users = User.global_search(params[:query])
    else
      @users = User.all
    end
  end

  def user_params
    params.require(:user).permit(:name, :interest_list)
  end
end
