FactoryGirl.define do
  factory :event do
    description "My Super Cool Event"
    start_date { Date.today }
    end_date { Date.today + 1.day }
  end

  factory :future_event, parent: :event do
    start_date { Date.today + 8.days }
    end_date { Date.today + 9.days }
  end
end
