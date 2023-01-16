class UsersController < ApplicationController
    def create 
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/'
        else
            message = "Something went wrong. Please try again."
            render :new, notice: message
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end