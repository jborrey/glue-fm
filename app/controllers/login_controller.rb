require 'google/api_client/client_secrets'

class LoginController < ApplicationController
  skip_before_filter :authenticate, only: :create

  # This method handles the GET request that comes from a redirect off of the
  # Google OAuth login flow. We will get a code param from Google to verify..
  def signin
    # Authenticates the user based on the code param and gets useful user details.
    user_details = GoogleOAuth.new(GlueFm.oauth_redirect_url).user_details(params[:code])

    # Create a session between the user and the app just via a cookie.
    session[:user_details] = user_details

    head :ok
  end

  def user_details
    user_details = session[:user_details]
    render json: user_details
  end
end
