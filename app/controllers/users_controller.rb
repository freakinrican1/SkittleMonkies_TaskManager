class UsersController < ApplicationController
  
  skip_before_filter :authorize
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to user_path
    else
      "THIS AINT WORKING!"
    end
  end
end
