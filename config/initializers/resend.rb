Resend.api_key = Rails.application.credentials.dig(:resend, :api_key)

# Configure ActionMailer to use Resend
ActionMailer::Base.add_delivery_method(
  :resend,
  Mail::Resend,
  api_key: Rails.application.credentials.dig(:resend, :api_key)
)
