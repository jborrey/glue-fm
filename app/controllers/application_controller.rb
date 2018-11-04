class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception
  before_action :set_csrf_cookie
  before_action :authenticate!

  private

  # We must manually set the CSRF token via a cookie for each request
  # since we are using RailsAPI and don't have native webpages.
  def set_csrf_cookie
    cookies['CSRF-TOKEN'] = form_authenticity_token
  end

  def authenticate!
    fail_request('Unauthorized', 401) if current_user.nil?
  end

  def current_user
    return nil if session[:user_id].nil?
    User.where(id: session[:user_id]).first
  end

  def fail_request(error, status)
    render json: { error: error }, status: status
  end
end
