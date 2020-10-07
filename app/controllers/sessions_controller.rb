class SessionsController < ApplicationController

def create
  #  byebug
   if params[:user][:name] != nil 
    @user = User.find_by(name: params[:user][:name])
     return head(:forbidden) unless @user.authenticate(params[:user][:password])
    # byebug
    session[:user_id] = @user.id
    else  
        redirect_to '/'
    end
end


    
end