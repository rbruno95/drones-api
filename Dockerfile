FROM ruby:3.1.2

RUN apt-get update -qq \
  && apt-get install -y \
    build-essential \
    libpq-dev \
    cron \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

ENV APP_HOME /drones_api
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_ENV production

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME

RUN gem install bundler -v 2.3.14
RUN bundle install

ADD . $APP_HOME

RUN crontab -l | { cat; echo ""; } | crontab -

RUN bundle exec whenever --update-crontab

CMD ["rails", "server", "-b", "0.0.0.0"]
