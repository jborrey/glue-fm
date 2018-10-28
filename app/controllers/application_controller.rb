class ApplicationController < ActionController::API
  class UnauthorizedError < StandardError; end

  private

  def authenticate!
    user_details = session[:user_details]

    raise UnauthorizedError unless user_details.present? && user_details.include?('email')
  end

  def current_user
    session[:user_details]['email']
  end
end
