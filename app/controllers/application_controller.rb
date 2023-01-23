class ApplicationController < ActionController::Base
  before_action :set_user

  before_action :validate_user

  around_action :set_locale

  def set_user
    @_user = User.find_by(id: session[:user_id])
  end

  def validate_user
    redirect_to new_session_path unless @_user
  end

  def set_locale(&action)
    session[:locale] = params[:locale] if params[:locale].present?

    @_locale = session[:locale] || I18n.default_locale

    I18n.with_locale(@_locale, &action)
  end
end
