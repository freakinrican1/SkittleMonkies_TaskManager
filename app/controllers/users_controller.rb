class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to tasks_path
    else
      "THIS AINT WORKING!"
    end
  end
end
