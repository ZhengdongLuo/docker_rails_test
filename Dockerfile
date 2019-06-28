FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs sqlite3
RUN mkdir /docker_rails_test
WORKDIR /docker_rails_test
COPY Gemfile /docker_rails_test/Gemfile
COPY Gemfile.lock /docker_rails_test/Gemfile.lock
RUN gem install bundler && bundle install
COPY . /docker_rails_test

ENTRYPOINT rails s -b 0.0.0.0
EXPOSE 3000
