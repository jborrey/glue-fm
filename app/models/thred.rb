# Thread is a special word in Ruby, so we spell our table wrong ...
class Thred
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  belongs_to :channel
  has_many :comments
end
