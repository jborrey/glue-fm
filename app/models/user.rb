class User
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :name,  type: String, required: true
  field :email, type: String, required: true,
                uniq: true, index: true, validates: { format: { with: URI::MailTo::EMAIL_REGEXP } }
end
