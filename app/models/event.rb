class Event < ActiveRecord::Base
  validates :description, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true, date: { before: :end_date }
  validates :end_date, presence: true, date: true

  def self.weeks_events(date_param)
    week = Date.parse(date_param)
    @start_of_week = week.beginning_of_week
    @end_of_week = week.end_of_week

    where(
      'start_date <= ? and end_date >=?', @end_of_week, @start_of_week
    )
  end
end
