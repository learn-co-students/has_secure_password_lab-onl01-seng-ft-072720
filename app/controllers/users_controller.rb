class UsersController < ApplicationController

  

   
        def create
           # byebug
          @user =  User.create(user_params)
        #   byebug
            if @user.save 
                session[:user_id] = @user.id 
                # byebug
                render :'/users/homepage'
            else 
           
           redirect_to '/'
      
            end
        end
       
        private
       
        def user_params
          params.require(:user).permit(:name, :password, :password_confirmation)
        end
     

end