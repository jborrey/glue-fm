Rails.application.routes.draw do
  # Static pages
  # TODO: root + about
  # About page:
  #   - we wanted to have a better way to share music
  #   - messenger apps didnt do playlists, link translation, threading,
  #     keep track of what you have listened to
  #   - contact email / github links

  # TODO: resource for channels
  # TODO: resource for threads/messages
  # TODO: resource for users

  mount ActionCable.server => '/cable'
end
