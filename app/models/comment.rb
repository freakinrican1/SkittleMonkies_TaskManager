class Comment < ActiveRecord::Base
  attr_accessible :content, :task_id, :user_id
  
  belongs_to :user
  belongs_to :task
end
