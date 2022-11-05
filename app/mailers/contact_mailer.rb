class ContactMailer < ApplicationMailer
  def send_mail(mail_title,mail_content,team_users) #メソッドに対して引数を設定
    @mail_title = mail_title
    @mail_content = mail_content
    mail bcc: team_users.pluck(:email), subject: mail_title
  end
end
