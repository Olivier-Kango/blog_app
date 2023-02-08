class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @users = User.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    if user_signed_in?
      @user = User.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end
end
