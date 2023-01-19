class ApplicationController < ActionController::Base
  before_action :set_user

  before_action :validate_user

  def set_user
    @_user = User.find_by(id: session[:user_id])
  end

  def validate_user
    redirect_to new_session_path unless @_user
  end
end
