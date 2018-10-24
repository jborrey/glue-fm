class Comment
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  belongs_to :thred
  belongs_to :user

  field :message, type: Text, required: true
end
