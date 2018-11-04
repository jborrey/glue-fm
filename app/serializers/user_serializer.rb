class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :picture_url
end
