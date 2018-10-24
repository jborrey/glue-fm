class CommentSerializer < ActiveModel::Serializer
  attributes :id, :message, :updated_at
end
