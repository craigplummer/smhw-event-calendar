require 'rails_helper'
RSpec.describe EventsController, type: :controller do

  describe 'GET index' do
    describe 'with format: json' do
      it 'returns a list of events for the current week' do
        events = FactoryGirl.create_list(:event, 3)
        get :index, format: :json
        expect(assigns(:events)).to eq(events)
      end

      it 'returns events for a future week' do
        events = FactoryGirl.create_list(:event, 3)
        future_events = FactoryGirl.create_list(:future_event, 3)
        get :index, format: :json, week: (Date.today + 8.days).to_s
        expect(assigns(:events)).to eq(future_events)
      end
    end

    describe 'with format: html' do
      it 'renders the index template' do
        get :index, format: :html
        expect(response).to render_template(:index)
      end
    end
  end
end
