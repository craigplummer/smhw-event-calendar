require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(255) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }

    it 'should be invalid with end date before start date' do
      event = FactoryGirl.build(:event,
                                start_date: Time.now,
                                end_date: Time.now - 1.day)

      expect(event).to_not be_valid
    end
  end
end
