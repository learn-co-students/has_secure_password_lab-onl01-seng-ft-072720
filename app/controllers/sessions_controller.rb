class SessionsController < ApplicationController

    def new
        current_user
    end

    def create
        if @user = User.find_by_name(params[:user][:name]).authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else
            redirect_to new_session_path
        end
    end

    def destroy
        session.clear
    end

    private

        def session_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end

end
