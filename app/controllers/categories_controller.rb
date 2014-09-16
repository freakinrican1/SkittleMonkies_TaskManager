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
end
