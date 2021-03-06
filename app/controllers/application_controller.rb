class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?

  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return unless logged_in?
    @current_user ||= User.find(session[:user_id])
  end

  def authencate
    redirect_to root_path, alert: 'ログインしてください' unless logged_in?
  end
end
