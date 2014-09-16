class Project < ActiveRecord::Base
  attr_accessible :description, :title, :username
  has_many :tasks through => categories
  
end
