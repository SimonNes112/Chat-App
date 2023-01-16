class SessionsController < ApplicationController
    def new
        @user = User.create
    end
    def create
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to  '/'

        else
            raise "hell"
            message = "Er ging iets fout probeer het opnieuw"
            redirect_to '/login',notice: message
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to [:new, :session]
    end
    private 
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
    
end