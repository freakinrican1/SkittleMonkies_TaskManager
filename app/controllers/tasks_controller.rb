class TasksController < ApplicationController
  
  skip_before_filter :authorize, :only => [:index, :show]
  
  def index
    @tasks = Task.all
  end

  def new
    @category = Category.find_by_user_id(session[:user_id])
    @task = Task.new
    @categories = Category.where(user_id: session[:user_id])
    binding.pry
  end

  def create
    @task = Task.new(params[:task])
    @task.user_id = current_user.id
    @category = Category.find_by_user_id(session[:user_id])    
    
    # if @category.nil?
    #
    # else
    #   cat_id = @category.id
    #   task_id = @task.id
    #   binding.pry
    #   @cat_task = CategoriesTasks.create(:category_id => cat_id, :task_id => task_id)

    # end
    if @task.save
      Pony.mail({
        :to => "#{@task.email}",
        :via => :smtp,
        :subject => "#{current_user.email}" + "Has assigned you a task",
        :body => "#{@task.description}",
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'skittlemonkey2000',
          :password             => 'tastetherainbow',
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
        
          }
        })
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

    @category = Category.find_by_user_id(session[:user_id])

    @task = Task.find(params[:id])
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
