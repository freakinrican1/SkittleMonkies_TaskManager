class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_many :tasks

  has_secure_password

end
