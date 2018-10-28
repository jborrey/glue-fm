Rails.application.routes.draw do
  # TODO: resource for channels
  # TODO: resource for threads/messages
  # TODO: resource for users

  post '/signin', to: 'Login#index'

  mount ActionCable.server => '/cable'
end
