class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_homepage_path
    else
      redirect_to users_new_path
    end
  end

  def welcome

  end

  def homepage
    current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def current_user
    @user = User.find(session[:user_id])
  end
end

