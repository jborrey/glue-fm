class ChannelUser
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  belongs_to :user
  belongs_to :channel
end
