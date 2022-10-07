class AccountMailer < ApplicationMailer
  def hello(user)
    @user = user
    mail to: @user.email, subject: "你好!!"
  end
end
