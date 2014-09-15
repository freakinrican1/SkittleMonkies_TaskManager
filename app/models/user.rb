class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_many :tasks
  
<<<<<<< HEAD
  # has_many :tasks
  has_secure_password
=======
>>>>>>> 94943f087104942e8cfe40dc0b3018a4065113ea
end
