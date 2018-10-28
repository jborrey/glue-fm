namespace :google_oauth do
  desc 'Generate the Google OAuth URI to send users to for login.'
  task auth_uri: :environment do
    redirect_uri = GlueFm.redirect_uri
    GoogleOAuth.new(redirect_uri).auth_uri
  end
end
