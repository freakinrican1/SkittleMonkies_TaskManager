class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_many :tasks
  
  has_secure_password

end
