class ProjectsController < ApplicationController
  
    skip_before_filter :authorize, :only => [:index, :show]
  
    def index
      @projects = Project.where(:user_id => current_user.id)
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(params[:project])
      @project.username = current_user.username
      @project.user_id = current_user.id

      if @project.save
        redirect_to projects_path
      else
        render "new"
      end
    end

    def show
      @project = Project.find(params[:id])
    end

    def edit
      @project = Project.find(params[:id])
    end

    def update
      @project = Project.find(params[:id])
      if @project.update_attributes(params[:project])
        redirect_to projects_path
      else
        render "edit"
      end
    end
end