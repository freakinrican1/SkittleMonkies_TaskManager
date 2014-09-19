class UsersController < ApplicationController
<<<<<<< HEAD
  
=======
>>>>>>> b0b2dd2c3f425dbaab5c6c0ac3cb9885dd275b9a
  skip_before_filter :authorize
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])    
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path
    else
      redirect_to signup_path, :alert => "Signup Error"
    end
  end
  
  def email
  end
  
end
