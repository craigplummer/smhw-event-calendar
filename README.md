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
