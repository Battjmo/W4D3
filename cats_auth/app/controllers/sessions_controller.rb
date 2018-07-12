class SessionsController < ApplicationController
  before_action :require_current_user, except: [:create, :new]
  before_action :logged_in_constraint
  
  def new
    type = "Sign In"
    action = new_session_url
    render 'shared/signup', type: type, action: action
  end
  
  def destroy
    reset_session_token! if current_user
    session[:session_token] = nil
  end 
  
  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
      
    if user
      login_user!
      redirect_to cats_url
    else
      flash.now[:errors] = user.errors.full_messages
    end
  end
  
end 