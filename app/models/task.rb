class Task < ActiveRecord::Base
  
  include PublicActivity::Common
  # tracked owner: ->(controller, model) { controller && controller.current_user }
  attr_accessible :description, :status, :task_name, :user_id, :email, :project_id, :category_id
  belongs_to :project
  belongs_to :user
  belongs_to :category  
  has_many :comments
  
<<<<<<< HEAD
=======
  def send_email(current_user)
    if self.email == ""
      puts "Email field was empty"
    else        
      Pony.mail({
        :to          => "#{self.email}",
        :via         => :smtp,
        :subject     => "#{current_user}" + "has assigned you a task",
        :body        => "Your task is " + "#{self.description}",
        :via_options => {
          :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'skittlemonkey2000',
          :password             => 'tastetherainbow',
          :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      
          }
        })
      end
  end
>>>>>>> b0b2dd2c3f425dbaab5c6c0ac3cb9885dd275b9a
end
