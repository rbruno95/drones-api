FROM ruby:3.1.2

WORKDIR /drones
COPY . /drones/

RUN gem install bundler -v 2.3.13
RUN bundle install
RUN bundle exec rails db:reset

CMD ["rails", "server", "-b", "0.0.0.0"]
