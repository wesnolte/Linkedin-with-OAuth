class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this page."
      redirect_to root_url
    end
  end  

  def logged_in?
    !!current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
