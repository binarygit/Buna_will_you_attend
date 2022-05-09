class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :buna?

  private

  def authenticate_user
    unless logged_in?
      redirect_to root_path, alert: 'You need to login first!'
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    true if current_user
  end

  def buna?
    true if current_user.access_level.name == 'privileged'
  end
end
