Rails.application.routes.draw do
  # TODO: resource for channels
  # TODO: resource for threads/messages

  get '/_health', to: 'static#health'

  post '/auth/google_oauth2/callback', to: 'users#oauth_callback'
  get '/users/self-data', to: 'users#self_data'

  mount ActionCable.server => '/cable'
end
