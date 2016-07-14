class Event < ActiveRecord::Base
  validates :description, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true, date: { before: :end_date }
  validates :end_date, presence: true, date: true
end
