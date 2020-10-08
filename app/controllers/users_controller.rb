class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        if User.find_by_name(params[:user][:name])
            flash[:alert] = "User name is already taken."
        elsif
            params[:user][:password] != params[:user][:password_confirmation]
            flash[:alert] = "Password and confirmation do not match."
        elsif
            params[:user][:password].blank? || params[:user][:password_confirmation].blank?  || params[:user][:name].blank? 
            flash[:alert] = "Field cannot be blank."
        end

        if flash[:alert]
            redirect_to new_user_path
        else
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to root_path
        end
    end

    def home
        current_user
    end

        private

        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end

        

end