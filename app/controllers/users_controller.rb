class UsersController < ApplicationController
  skip_before_action :validate_user, only: %i[new create]

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      message = 'Something went wrong. Please try again.'
      render :new, notice: message
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
