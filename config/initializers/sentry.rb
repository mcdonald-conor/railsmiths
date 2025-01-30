if Rails.env.production?
  Sentry.init do |config|
    config.dsn = ENV['SENTRY_DSN']
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
    config.traces_sample_rate = 0.5

    # Only send errors in production
    config.enabled_environments = %w[production]

    # Add user context to errors
    config.send_default_pii = true
  end
end
