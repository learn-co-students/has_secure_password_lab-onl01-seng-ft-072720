class SessionsController < ApplicationController
    def new

    end

    def create
        @user = User.find_by(name: params[:user][:name])
        # byebug
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else
            redirect_to new_users_path
        end
    end

    def destroy
        session.delete :user_id
    end
end
