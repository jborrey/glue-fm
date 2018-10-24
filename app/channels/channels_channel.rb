class ChannelsChannel < ApplicationCable::Channel
  INIT_THREAD_LIMIT = 20

  def subscribed
    # Connect the caller to the channel they asked for.
    stream_for current_channel

    # Get initial data to pump into the stream.
    init_comments = []
    threds = current_channel.threds.order_by(created_at: :desc).limit(INIT_THREAD_LIMIT)
    threds.each do |thred|
      thred.comments.each do |comment|
        init_comments << ActiveModelSerializers::Adapter::Json.new(
          CommentSerializer.new(comment)
        ).serializable_hash
      end
    end
    ChannelsChannel.broadcast_to(current_channel, init_comments)

    # Devote this thread to showing updates from the DB.
    # For the given channel, we must watch for new threads.
    # For our given threads, we must watch for new messages.
    # TODO: Make this scalable for n->inf threads in the channel.
    Comment.where(channel_id: current_channel.id).raw.changes.each do |change|
      # For a new comment that is created, this is what the change Hash could be.
      # {
      #   "new_val" => {
      #     "channel_id" => "6q0rmAffnNnTzA",
      #     "created_at"=>2018-10-24 19:58:01 +0000,
      #     "id"=>"6q0tJCVh23p3t6",
      #     "message"=>"hi",
      #     "thred_id"=>"6q0rmAg8pdFahw",
      #     "updated_at"=>2018-10-24 19:58:01 +0000,
      #     "user_id"=>"6q0rmAf353C0M8"
      #   },
      #   "old_val"=>nil
      # }

      # TODO: handle editing of comments.
      payload = {
        id: change['new_val']['id'],
        thred_id: change['new_val']['thred_id'],
        user_id: change['new_val']['user_id'],
        created_at: change['new_val']['created_at'],
        message: change['new_val']['message']
      }

      ChannelsChannel.broadcast_to(current_channel, [{ comment: payload }])
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def current_channel
    # TODO: authorize user for channel
    # TODO: channel selection
    # Channel.find(params[:channel_id])
    Channel.first
  end
end
