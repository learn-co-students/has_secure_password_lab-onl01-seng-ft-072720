class SessionsController < ApplicationController
    def new

    end

    def create
        if @user = User.find_by(name: params[:user][:name])
          return head(:forbidden) unless @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to users_homepage_path
        else
          redirect_to sessions_new_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end
