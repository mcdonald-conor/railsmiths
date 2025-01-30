class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:resend, :from_email)
  layout "mailer"
end
