FROM ruby:3.1.2

RUN apt-get update -qq \
  && apt-get install -y \
    build-essential \
    cron \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

ENV APP_HOME /usr/src/app
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_ENV production

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock
RUN gem install bundler -v 2.3.14
RUN bundle install

COPY . $APP_HOME

RUN crontab -l | { cat; echo ""; } | crontab -

RUN bundle exec rails db:reset

RUN bundle exec whenever --update-crontab

CMD ["rails", "server", "-b", "0.0.0.0"]
