ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'example.com',
    user_name:            'skittlemonkey2000',
    password:             ENV['mailer_pswd'],
    authentication:       'plain',
    enable_starttls_auto: true  }
  
  
  