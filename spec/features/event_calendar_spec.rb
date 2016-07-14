require 'rails_helper'

describe 'displaying the event calendar', js: :true do
  it 'the calendar is rendered' do
    visit events_path
    expect(page).to have_selector('.fc')
  end

  it 'renders events that are in the calendar', js: true do
    event = FactoryGirl.create(:event, description: 'My Event')

    visit events_path
    expect(page).to have_selector('.fc-title', text: 'My Event')
  end

  it 'renders future events that are in the calendar', js: true do
    event = FactoryGirl.create(:future_event, description: 'My Future Event')

    visit events_path
    page.find('.fc-next-button').click
    expect(page).to have_selector('.fc-title', text: 'My Future Event')
  end
end
