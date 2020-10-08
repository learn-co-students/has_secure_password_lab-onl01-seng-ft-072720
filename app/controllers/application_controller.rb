class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user = User.find_by_id(session[:user_id]) || User.new
  end

  def logged_in?
    !!session[:user_id] && session[:user_id] == current_user.id
  end


end
