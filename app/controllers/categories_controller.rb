class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    @category.user_id = current_user.id    
    if @category.save
      redirect_to tasks_path
    else
      render "new"
    end
  end
  
  def update    
    @task = Task.find(params[:id])
    @category = Category.find_by_user_id(session[:user_id])
    cat_id = @category.id
    task_id = @task.id
    binding.pry
    @cat_task = CategoriesTasks.create(:category_id => cat_id, :task_id => task_id)    
  end
  
end
