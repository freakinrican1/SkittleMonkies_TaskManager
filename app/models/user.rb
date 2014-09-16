class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_many :tasks
  
   validates :username, presence: true, uniqueness: true
    validates :email,  presence: true, uniqueness: true
    validates :password, presence: true , confirmation: true
    validates :password_confirmation, presence: true


  has_secure_password

end
