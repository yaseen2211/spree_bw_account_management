class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def send_email_to_vendor name, email
    mail(to: "vendor@gmail.com", subject: "You have a new message")
  end

end
