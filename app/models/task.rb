class Task < ActiveRecord::Base
  attr_accessible :description, :status, :task_name, :user_id, :email
  belongs_to :project
  belongs_to :user
  belongs_to :category  
  has_many :comments
end
