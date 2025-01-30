class SignupMailer < ApplicationMailer
  def welcome_email(signup)
    @signup = signup
    @unsubscribe_url = unsubscribe_signup_url(@signup.id)

    mail(
      to: @signup.email,
      subject: "Welcome to Railsmiths Mobile Waitlist! ��"
    )
  end
end
