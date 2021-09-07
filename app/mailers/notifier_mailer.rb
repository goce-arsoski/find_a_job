class NotifierMailer < ApplicationMailer
  def welcome(appuser, jobuser)
    mail(from: appuser.email,
         to: [appuser.email, jobuser.email]
        )
  end
end
