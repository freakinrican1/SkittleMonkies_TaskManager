class Task < ActiveRecord::Base
  attr_accessible :description, :status, :task_name, :user_id, :email, :project_id, :category_id
  belongs_to :project
  belongs_to :user
  belongs_to :category  
end
