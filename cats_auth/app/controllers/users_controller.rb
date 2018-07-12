class UsersController < ApplicationController
  before_action :logged_in_constraint
    
  def new 
    @user = User.new
    type = "Sign Up"
    action = users_url
    render 'shared/signup', type: type, action: action
  end 
  
  def create 
    @user = User.new(user_params)

    if @user.save
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
        redirect_to new_user_url
    end
  end
  

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
  #END OF CLASS
end