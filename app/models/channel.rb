class Channel
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  has_many :channel_users
  has_many :threds

  field :name,  type: String, required: true
end
