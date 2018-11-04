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
  PROD_WWW_DOMAIN     = 'https://glue.fm'.freeze
  DEV_WWW_DOMAIN      = 'localhost:3001'.freeze

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

    # Despite this being the API version of Rails, we will use cookies with our web
    # frontend (instead of an API key or JWTs) since cookies are far more secure.
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    # config.action_cable.mount_path = '/cable'
  end

  def self.www_domain
    Rails.env.production? ? PROD_WWW_DOMAIN : DEV_WWW_DOMAIN
  end
end
