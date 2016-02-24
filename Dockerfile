FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev mysql-client
RUN mkdir /opt/migrations
WORKDIR /opt/migrations
ADD Gemfile /opt/migrations/Gemfile
ADD Gemfile.lock /opt/migrations/Gemfile.lock
RUN bundle install -j 8
