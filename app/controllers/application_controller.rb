class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def lita
    User.find_or_create_by(username: 'Lita')
  end


  protected

  def authenticate_user!
    redirect_to root_path unless logged_in?
  end
end