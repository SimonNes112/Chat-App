class SessionsController < ApplicationController
  skip_before_action :validate_user, only: %i[new create]

  def new
    @user = User.create
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      message = 'Er ging iets fout probeer het opnieuw'
      redirect_to '/login', notice: message
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to %i[new session]
  end
end
