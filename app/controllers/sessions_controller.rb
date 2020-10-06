class SessionsController < ApplicationController
  def new
    @user = User.new 
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else 
      redirect_to '/login', notice: "Login is incorrect"
    end 
  end 
end



