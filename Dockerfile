# syntax=docker/dockerfile:1.0.2-experimental
FROM ruby:3.0-alpine

ENV BUNDLER_VERSION=2.2

RUN addgroup -g 1000 -S interview && \
    adduser -u 1000 -S interview -G interview

RUN apk update && \
    apk add --no-cache \
    build-base \
    git

RUN gem install bundler -v $BUNDLER_VERSION --no-document

WORKDIR /usr/src/app

COPY --chown=interview:interview  . .

RUN bundle install

USER interview
