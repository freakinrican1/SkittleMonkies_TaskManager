class Project < ActiveRecord::Base
  
  attr_accessible :description, :title, :username, :user_id
  include PublicActivity::Common
  has_many :tasks 
  belongs_to :user  
  
end
