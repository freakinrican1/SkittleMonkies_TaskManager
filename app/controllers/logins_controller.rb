class LoginsController < ApplicationController
  
  skip_before_filter :authorize
  
  def new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to tasks_path
    else
      redirect_to login_path, :alert => "Invalid Login"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to tasks_path
  end
end
