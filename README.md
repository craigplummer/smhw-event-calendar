# smhw-event-calendar

## Setup

1. Install the gems `bundle install`
2. Migrate the database `bundle exec rake db:migrate`
3. Start the rails server `bundle exec rails s`
4. View the events calendar [http://0.0.0.0:3000/events](http://0.0.0.0:3000/events)

## Running tests

1. Migrate the test database `bundle exec rake db:migrate RAILS_ENV=test`
2. Run rspec test suite `bundle exec rspec spec`

You may need to install phantomjs to run the test suite. This can be installed on a Mac by running `brew install phantomjs` instructions for other OSs can be found [here](https://github.com/teampoltergeist/poltergeist#installing-phantomjs).

## Other notes

- I chose to use fullcalendar to render the weekly calendar as this seemed to be the most supported calendar plugin for jQuery. With more time I think I would render a calendar myself, as then I can load weekly data rather than all the events in one request.
- I would have normally have used a Javascript framework such as AngularJS to structure my code, however given the scope of the task I decided to just use JQuery and a standard script file.
- I would normally use JSON API format requests, with Active Model Serializer. However as fullcalendar requires the json to be in a particular format, rather than manipulate this on the client side I chose to add a serializer that returned the data it required. If this application were to grow then it would probably be advised to switch to the JSON API standard.

