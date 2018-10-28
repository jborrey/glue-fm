require 'google/api_client/client_secrets'
require 'google-id-token'

class GoogleOAuth
  # Scopes must allow the app to fetch:
  #   first name + last name: Used to identify chat messages.
  #   email: used as a user_id
  #   profile picture URI: used for profile picture
  SCOPES = %w[
    https://www.googleapis.com/auth/userinfo.picture
    https://www.googleapis.com/auth/plus.me
  ].freeze

  def initialize(redirect_uri)
    # Assumes that the secret JSON file is at pwd.
    @client_secrets = Google::APIClient::ClientSecrets.load
    @auth_client = client_secrets.to_authorization
    @auth_client.update!(scopes: SCOPES, redirect_uri: redirect_uri)
  end

  # Returns the URI to direct users to when they start the OAuth flow.
  def auth_uri
    @auth_client.authorization_uri.to_s
  end

  # Given the code returned from a redirected user, eturns the user email and profile picture URI.
  def user_details(code)
    @auth_client.code = code
    @auth_hash = @auth_client.fetch_access_token!
    @basic_id = parse_id_token(@auth_hash[:id_token]) # MIGHT not use this and use G+ instead
    { email: @id['email'], picture_uri: @id['picture'] }
  end

  # TODO: CRSF attacks with random var.
  # TODO: Replay protection with nonce enforcement.

  private

  def parse_id_token(id_token)
    validator = GoogleIDToken::Validator.new(x509_cert: X509_CERT)
    validator.check(id_token, @client_secrets.client_id)
  end
end
