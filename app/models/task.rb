class Task < ActiveRecord::Base
  attr_accessible :description, :status, :task_name, :user_id. :email
  belongs_to :user
  
end
