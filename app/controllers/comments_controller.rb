class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @user = User.find(session[:user_id])
    @task = Task.find(params[:task_id])
    @comment.user_id = @user.id
    @comment.task_id = @task.id
    if @comment.save
      redirect_to task_path(@task.id)
    else
      render "new"
    end
  end
end
