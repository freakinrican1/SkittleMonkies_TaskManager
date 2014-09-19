class ApplicationController < ActionController::Base
  protect_from_forgery
  include PublicActivity::StoreController

  skip_before_filter :authorize
  
  def authorize
    if current_user.nil?
      redirect_to signup_path, :alert => "You need to log in to do that."
    end
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  def index
    @activities = PublicActivity::Activity.all
  end
  
  helper_method :current_user
  hide_action :current_user
  
end

