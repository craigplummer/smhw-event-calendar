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

  it 'goes to the correct week when a future event is added', js: true  do
    visit events_path
    click_on 'Create event'
    fill_in 'Description', with: 'My new future event'
    fill_in 'Start date', with: (Date.today + 8.days).to_s
    fill_in 'End date', with: (Date.today + 10.days).to_s
    click_on 'Create Event'

    within('#events_calendar') do
      expect(page).to have_selector('.fc-title', text: 'My new future event')
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
