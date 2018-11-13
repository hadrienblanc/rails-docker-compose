# more info : https://docs.docker.com/compose/rails/
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# for the docker image in production 
# RUN RAILS_ENV=production rails assets:precompile

COPY . /myapp
