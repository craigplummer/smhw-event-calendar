class EventSerializer < ActiveModel::Serializer
  attribute :id
  attribute :description, key: :title
  attribute :start_date, key: :start
  attribute :end_date, key: :end
end
