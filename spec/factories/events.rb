FactoryGirl.define do
  factory :event do
    description "My Super Cool Event"
    start_date { Date.today }
    end_date { Date.today + 1.day }
  end
end
