Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    {
      scope: 'userinfo.email, userinfo.profile',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50,
      provider_ignores_state: true # hybrid auth is immune to CSRF # TODO: Check
    }
end

OmniAuth.config.full_host = GlueFm.www_domain
