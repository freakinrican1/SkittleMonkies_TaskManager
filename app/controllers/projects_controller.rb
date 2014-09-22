class ProjectsController < ApplicationController
  
  skip_before_filter :authorize, :only => [:index, :show]
  
  def index
    if current_user.nil?
      redirect_to signup_path, :alert => "You need to log in to do that."
    else
      @projects = Project.where(:user_id => current_user.id)
    end
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    @project.username = current_user.username
    @project.user_id = current_user.id
    if @project.save
      @project.create_activity :create, owner: current_user
      redirect_to projects_path
    else
      render "new"
    end
  end

  def show
    @project = Project.find_by_title(params[:title])
  end

  def edit
    @project = Project.find_by_title(params[:title])
  end

  def update
    @project = Project.find_by_title(params[:title])
    if @project.update_attributes(params[:project])
      redirect_to projects_path
    else
      render "edit"
    end
  end
end
