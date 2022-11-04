class ContactMailer < ApplicationMailer
  def send_when_admin_reply(user, contact) 
    @user = user 
    @answer = contact.reply_text 
    mail to: user.email, subject: '【サイト名】 お問い合わせありがとうございます'
  end
end
