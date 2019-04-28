class UserMailer < ApplicationMailer
  default from: 'notifications@myblog.com'

  def user_welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Apple Music')
  end

  def user_created
    @admin = params[:user]
    mail(to: @admin.email, subject: 'New User Created')
  end

end
