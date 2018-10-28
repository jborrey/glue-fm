require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_job/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GlueFm
  PROD_APP_DOMAIN = 'https://glue.fm'.freeze
  DEV_APP_DOMAIN = 'localhost:3000'.freeze # API will run at localhost:3001
  OAUTH_REDIRECT_PATH = '/channels'.freeze

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # config.action_cable.mount_path = '/cable'
  end

  def app_domain
    Rails.env.production? ? PROD_APP_DOMAIN : DEV_APP_DOMAIN
  end

  def oauth_redirect_url
    "#{app_domain}/#{OAUTH_REDIRECT_PATH}"
  end
end
