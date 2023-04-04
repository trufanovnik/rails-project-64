# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = 'https://b186ed8c549040f2b13d59b115199593@o4504957029842944.ingest.sentry.io/4504957032005632'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end
