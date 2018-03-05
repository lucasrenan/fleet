FROM ruby:2.5.0-slim

RUN apt-get update && \
    apt-get install -y git

WORKDIR /app

COPY . ./

ENV \
  BUNDLE_GEMFILE=./Gemfile \
  BUNDLE_JOBS=2

RUN bundle install
