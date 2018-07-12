class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
    
  def logged_in_constraint
    redirect_to cats_url if current_user
  end
  
  def require_current_user
    redirect_to new_session_url if current_user.nil?
  end
  
  def current_user
    User.find_by(session[:session_token])
  end
  
  def login_user!
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
  
end
