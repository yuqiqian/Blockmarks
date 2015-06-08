class UserMailer < ApplicationMailer
  default from:'notifiactions@blocmarks.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/login'
    mail(to: @user.email, subject:'Welcome to Blocmarks!')
  end

end
