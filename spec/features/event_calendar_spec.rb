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

  describe 'adding an event to the event calendar' do
    it 'adds a valid event to the event calendar', js: true do
      visit events_path
      click_on 'Create event'
      fill_in 'Description', with: 'My new event'
      fill_in 'Start date', with: Date.today.to_s
      fill_in 'End date', with: (Date.today + 1.day).to_s
      click_on 'Create Event'

      within('#events_calendar') do
        expect(page).to have_selector('.fc-title', text: 'My new event')
      end
    end

    it 'displays an error message when an invalid event is added', js: true do
      visit events_path
      click_on 'Create event'
      fill_in 'Start date', with: Date.today.to_s
      fill_in 'End date', with: (Date.today + 1.day).to_s
      click_on 'Create Event'

      within('#event_form_errors') do
        expect(page).to have_content('Description can\'t be blank')
      end
    end
  end
end
