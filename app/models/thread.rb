class Thread
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  belongs_to :channel
  has_many :comments
end
