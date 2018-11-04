class User
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  has_many :channel_users
  has_many :threds
  has_many :comments

  field :name,  type: String, required: true
  field :email, type: String, required: true,
                uniq: true, index: true, validates: { format: { with: URI::MailTo::EMAIL_REGEXP } }
  field :picture_url, type: Text, required: true
end
