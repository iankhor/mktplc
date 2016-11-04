class ContactMailer < ApplicationMailer

  default from: 'contact@coderfactory.com'
  def send_contact_email(email, message)
    @email = email
    @message = message
    mail(
        to: 'hinchy@gmail.com',
        subject: 'new message from website'
    ) do |format|
        format.text { render 'contact_mailer'}
        format.text { render 'contact_mailer'}
      end
  end
end
