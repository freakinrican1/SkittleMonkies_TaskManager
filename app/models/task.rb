class Task < ActiveRecord::Base
  include PublicActivity::Common
  
  attr_accessible :description, :status, :task_name, :user_id, :email, :project_id, :category_id
  
  belongs_to :project
  belongs_to :user
  belongs_to :category
  has_many :comments
  
  def send_email(current_user)
    if self.email == ""
      puts "Email field was empty"
    else        
      Pony.mail({
        :to          => "#{self.email}",
        :via         => :smtp,
<<<<<<< HEAD
        :subject     => "#{current_user}" + " has assigned you a task.",
        :body        => "Your task is " + "#{self.description}. Check it out at http://skittlemonkey-taskmanager.herokuapp.com/",
=======
        :subject     => "#{current_user}" + "has assigned you a task",
        :body        => "Your task is " + "#{self.description}. Check it out at http://skittlemonkey-taskmanager.herokuapp.com/!",
>>>>>>> 984e1cc1505ffe6d5633ddbb810ace3f48ee2fb8
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'skittlemonkey2000',
          :password             => 'tastetherainbow',
          :authentication       => :plain,
          :domain               => "localhost.localdomain"    
        }
      })
    end
  end
end
