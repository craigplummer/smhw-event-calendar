require 'rails_helper'

describe 'displaying the event calendar', js: :true do
  it 'the calendar is rendered' do
    visit events_path
    expect(page).to have_selector('.fc')
  end
end
