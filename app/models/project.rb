class Project < ActiveRecord::Base
  attr_accessible :description, :title, :username, :user_id
  has_many :tasks # through => categories
  belongs_to :user
  
end
