class ProjectsController < ApplicationController
  
    skip_before_filter :authorize, :only => [:index, :show]
  
    def index
      @projects = Project.all
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(params[:project])
      @project.username = current_user.username

      if @project.save
        redirect_to tasks_path
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
        redirect_to tasks_path
      else
        render "edit"
      end
    end
end