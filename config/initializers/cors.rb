# Be sure to restart your server when you modify this file.
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins GlueFm.www_domain

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
