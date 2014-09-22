class Project < ActiveRecord::Base
  include PublicActivity::Common
    
  attr_accessible :description, :title, :username, :user_id

  has_many :tasks 
  belongs_to :user  
  
end
