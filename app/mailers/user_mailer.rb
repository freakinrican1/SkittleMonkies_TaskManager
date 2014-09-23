class UserMailer < ActionMailer::Base
  default from: 'ENV[mailer_email]'
 
  def test_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end