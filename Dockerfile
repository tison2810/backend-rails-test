# backend/Dockerfile

ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs curl

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0 -p 3000"]
