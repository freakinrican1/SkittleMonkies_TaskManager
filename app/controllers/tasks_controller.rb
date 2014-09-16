class TasksController < ApplicationController
  
  skip_before_filter :authorize, :only => [:index, :show]
  
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @projects = Project.where(:user_id => current_user.id)
    @categories = Category.where(:user_id => current_user.id)
  end

  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id
    
    if @category.nil?
      
    else
      @category = Category.find_by_user_id(session[:user_id])
      cat_id = @category.id
      task_id = @task.id
      @cat_task = CategoriesTasks.create(:category_id => cat_id, :task_id => task_id)    
    end
    if @task.save
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def show
    @category = Category.find_by_user_id(session[:user_id])
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.new
    @projects = Project.where(:user_id => current_user.id)
    @categories = Category.where(:user_id => current_user.id)
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to tasks_path
    else
      render "edit"
    end
  end
end
