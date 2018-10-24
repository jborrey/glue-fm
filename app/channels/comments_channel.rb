class CommentsChannel < ApplicationCable::Channel
  def subscribed
    comment = Comment.find("6pvTNlUhgCDq94")
    stream_for comment
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
