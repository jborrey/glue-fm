class CommentSerializer < ActiveModel::Serializer
  attributes :id, :thred_id, :message, :created_at
end
