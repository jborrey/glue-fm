class UsersController < ApplicationController
  skip_before_action :authenticate!, only: :oauth_callback

  # The route to this method, "/auth/google_oauth2/callback", has middleware in front
  # of it which does all the valid checks with Google. That means that by the time we
  # get to this method, Google has approved. Otherwise the middleware would have raised.
  def oauth_callback
    auth_data = request.env['omniauth.auth'].extra.raw_info

    # Check if already have this user in the DB.
    # If not, create a row for them.
    user = User.where(email: auth_data['email']).first
    user ||= User.create(
      email: auth_data['email'],
      name: "#{auth_data['given_name']} #{auth_data['family_name']&.[](0)}",
      picture_url: auth_data['picture']
    )

    # Authenticate the user by setting their cookie.
    session[:user_id] = user.id

    head :ok
  end

  # Returns data back to the caller about itself.
  # This is based on the cookie that the browser has, but the React client does not have access to.
  def self_data
    render json: current_user
  end
end
