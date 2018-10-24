class Comment
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  belongs_to :user
  belongs_to :thred
  belongs_to :channel # We need this since you cannot watch the change feed of a join query.

  field :message, type: Text, required: true
end
