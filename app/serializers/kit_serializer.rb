class KitSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :emoji
end
